import datetime
from kervi.camera import CameraStreamer
from kervi_devices.motors.adafruit_i2c_motor_hat import AdafruitMotorHAT

CAM1 = CameraStreamer("cam1", "camera 1")
CAM1.link_to_dashboard("app")
motor_board = AdafruitMotorHAT()
motor_board.servo_motors[0].position.link_to(CAM1.pan)
motor_board.servo_motors[1].position.link_to(CAM1.tilt)
