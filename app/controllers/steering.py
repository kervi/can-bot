""" Sample controller """
from kervi.controller import Controller, UINumberControllerInput, UIButtonControllerInput
from kervi.hal import GPIO
from kervi.steering import MotorSteering
from kervi_devices.motors.adafruit_i2c_motor_hat import AdafruitMotorHAT

class SteeringController(Controller):
    def __init__(self):
        Controller.__init__(self, "controller.steering", "Manual steering")
        self.type = "motor"

        #define an input and link it to the dashboard panel
        self.all_off_button = UIButtonControllerInput("controller.steering.allOff", "All off", self)
        self.all_off_button.link_to_dashboard("app", "steering")

        self.speed_input = UINumberControllerInput("controller.steering.speed", "Speed", self)
        self.speed_input.min = -100
        self.speed_input.max = 100
        self.speed_input.value = 0
        self.speed_input.link_to_dashboard("app", "steering")

        self.direction_input = UINumberControllerInput("controller.steering.direction", "Direction", self)
        self.direction_input.min = -100
        self.direction_input.max = 100
        self.direction_input.value = 0
        self.direction_input.link_to_dashboard("app", "steering")

        self.motor_board = AdafruitMotorHAT()
        self.steering = MotorSteering(self.motor_board.dc_motors[1], self.motor_board.dc_motors[2])

    def input_changed(self, changed_input):
        print("steering input changed:", changed_input.input_id, changed_input.value)
        if changed_input == self.all_off_button:
            self.motor_board.dc_motors.stop_all()

        if changed_input == self.speed_input or changed_input == self.direction_input:
            self.steering.run(self.speed_input.value, self.direction_input.value)

SteeringController()

