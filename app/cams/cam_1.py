import datetime
from kervi.vision.camera import CameraStreamer
from kervi.devices.motors.PCA9685_i2c_servo import PCA9685ServoBoard

CAM1 = CameraStreamer("cam1", "camera 1")
CAM1.flip_vertical = True
CAM1.flip_horizontal = True
CAM1.link_to_dashboard("app")
motor_board = PCA9685ServoBoard()
motor_board.servo_motors[0].position.link_to(CAM1.pan, lambda x: -x)
motor_board.servo_motors[1].position.link_to(CAM1.tilt)
