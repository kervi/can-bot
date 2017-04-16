""" Sample controller """
#from kervi.controller import Controller
#from kervi.values import DynamicBoolean, DynamicNumber
#from kervi.hal import GPIO
from kervi.sensor import Sensor
from kervi.steering import MotorSteering
from kervi_devices.motors.adafruit_i2c_motor_hat import AdafruitMotorHAT
from kervi_devices.sensors.LSM9DS0 import LSM9DS0OrientationDeviceDriver


steering = MotorSteering()
steering.speed.link_to_dashboard("app", "steering")
steering.direction.link_to_dashboard("app", "steering")
steering.all_off.link_to_dashboard("app", "steering")


motor_board = AdafruitMotorHAT()
motor_board.dc_motors[2].speed.link_to(steering.left_speed)
motor_board.dc_motors[3].speed.link_to(steering.right_speed)


orientation_sensor = Sensor("orientation", "orientation", LSM9DS0OrientationDeviceDriver())
orientation_sensor.store_to_db = False
orientation_sensor.link_to_dashboard("app", "sensors", type="value", size=2)
