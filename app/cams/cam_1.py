import datetime
from kervi.camera import CameraStreamer
from kervi_devices.motors.PCA9685_i2c_servo import PCA9685ServoBoard

CAM1 = CameraStreamer("cam1", "camera 1")
CAM1.link_to_dashboard("app")
motor_board = PCA9685ServoBoard()
motor_board.servo_motors[0].position.link_to(CAM1.pan)
motor_board.servo_motors[1].position.link_to(CAM1.tilt)
