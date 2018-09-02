""" Sample controller """
#from kervi.controller import Controller
#from kervi.values import DynamicBoolean, DynamicNumber
#from kervi.hal import GPIO
from kervi.sensors.sensor import Sensor
from kervi.controllers.steering import MotorSteering
from kervi.devices.motors.adafruit_i2c_motor_hat import AdafruitMotorHAT
from kervi.devices.sensors.LSM9DS0 import LSM9DS0OrientationDeviceDriver

from kervi.controllers.controller import Controller
from kervi.values import NumberValue, BooleanValue
import time

class PIDController(Controller):
    def __init__(self, controller_id, name):
        Controller.__init__(self, controller_id, name)
        self._ready = False
        self.kp = self.inputs.add("kp", "Kp", NumberValue)
        self.kp.persist_value = True
        self.kd = self.inputs.add("kd", "Kd", NumberValue)
        self.kd.persist_value = True
        self.ki = self.inputs.add("ki", "Ki", NumberValue)
        self.ki.persist_value = True

        self.active = self.inputs.add("active", "Active", BooleanValue)
        self.windup_guard = self.inputs.add("windup_guard", "Windup guard", NumberValue)
        self.windup_guard.persist_value = True
        self.base_value = self.inputs.add("base_value", "Base value", NumberValue)
        self.base_value.persist_value = True

        self.value = self.inputs.add("value", "Value", NumberValue)
        self.result = self.outputs.add("pid_result", "PID result", NumberValue)

        self.sample_time = 0.00
        self.current_time = time.time()
        self.last_time = self.current_time

        self.p_term = 0.0
        self.i_term = 0.0
        self.d_term = 0.0
        self.last_error = 0.0

        # Windup Guard
        self.int_error = 0.0
        self.windup_guard.value = 20.0

        self._ready = True

    def input_changed(self, changed_input):
        if not self._ready:
            return
        if changed_input == self.active and not self.active.value:
            self.p_term = 0.0
            self.i_term = 0.0
            self.d_term = 0.0
            self.last_error = 0.0
            self.int_error = 0.0

        if changed_input == self.value:
            if self.active.value:
                error = self.value.value - self.base_value.value

                self.current_time = time.time()
                delta_time = self.current_time - self.last_time
                delta_error = error - self.last_error

                if delta_time >= self.sample_time:
                    self.p_term = self.kp.value * error
                    self.i_term += error * delta_time

                    if self.i_term < -self.windup_guard.value:
                        self.i_term = -self.windup_guard.value
                    elif self.i_term > self.windup_guard.value:
                        self.i_term = self.windup_guard.value

                    self.d_term = 0.0
                    if delta_time > 0:
                        self.d_term = delta_error / delta_time

                    self.last_time = self.current_time
                    self.last_error = error

                    self.result.value = self.p_term + (self.ki.value * self.i_term) + (self.kd.value * self.d_term)


steering = MotorSteering()
steering.speed.link_to_dashboard("app", "steering")
steering.direction.link_to_dashboard("app", "steering")
#steering.all_off.link_to_dashboard("app", "steering")

steering.speed.link_to_dashboard("app", "left_pad_y", pad_auto_center=True)
steering.direction.link_to_dashboard("app", "left_pad_x")

pid_controller = PIDController("balance_pid", "Balance pid")
pid_controller.kp.link_to_dashboard("app", "balance_pid")
pid_controller.ki.link_to_dashboard("app", "balance_pid")
pid_controller.kd.link_to_dashboard("app", "balance_pid")
pid_controller.windup_guard.link_to_dashboard("app", "balance_pid")
pid_controller.base_value.link_to_dashboard("app", "balance_pid")
pid_controller.active.link_to_dashboard("app", "balance_pid")

steering.adaptive_speed.link_to(pid_controller.result)


motor_board = AdafruitMotorHAT()
motor_board.dc_motors[2].speed.link_to(steering.left_speed)
motor_board.dc_motors[3].speed.link_to(steering.right_speed)


orientation_sensor = Sensor(
    "orientation",
    "Orientation",
    LSM9DS0OrientationDeviceDriver(),
    polling_interval=.1
)
orientation_sensor.store_to_db = False
orientation_sensor.link_to_dashboard("app", "sensors", type="value")

pid_controller.value.link_to(orientation_sensor[2])