""" My kervi application """
from kervi.bootstrap import Application
import kervi.utility.nethelper as nethelper

if __name__ == '__main__':
    APP = Application({
        "info":{
            "id":"can_bot",
            "name":"Kervi can bot",
            "appKey":"",
        },
        "modules":["sensors", "controllers", "cams"],
        "network":{
            "IPCSecret":b"094ad5ff-19d9-4357-9694-522cf2f0d9d4"
        },
    })

    APP.run()
