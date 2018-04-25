""" My kervi application """
from kervi.application import Application
import kervi.utility.nethelper as nethelper

if __name__ == '__main__':
    APP = Application({
        "application":{
            "id":"can_bot",
            "name":"Kervi can bot",
            "appKey":"",
        },
        "modules":["sensors", "controllers", "cams"],
    })

    APP.run()
