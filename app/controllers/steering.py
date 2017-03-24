""" Sample controller """
from kervi.controller import Controller, UINumberControllerInput, UISwitchButtonControllerInput
from kervi.hal import GPIO
from kervi_devices.motors.adafruit_i2c_motor_hat import AdafruitMotorHAT
class SteeringController(Controller):
    def __init__(self):
        Controller.__init__(self, "controller.steering", "Manual steering")
        self.type = "motor"

        #define an input and link it to the dashboard panel
        self.all_off_button = UISwitchButtonControllerInput("controller.steering.allOff", "All off", self)
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

        #define GPIO
        GPIO.define_as_pwm(12, 50)

    def input_changed(self, changed_input):
        if changed_input == self.light_button:
            if changed_input.value:
                GPIO.pwm_start(12)
            else:
                GPIO.pwm_stop(12)

        if changed_input.input_id == "lightctrl.level":
            #change the duty_cycle on the pwm pin
            GPIO.pwm_start(12, duty_cycle=changed_input.value)

LightController()

