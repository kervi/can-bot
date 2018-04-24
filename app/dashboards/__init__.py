""" bootstrap your kervi dashboards here """
from kervi.dashboards.dashboard import Dashboard, DashboardPanel

#Create the dashboards for your Kervi application here.
#Standard dashboard with several panels where sensors are placed.
#Each sensor create links to one or more dashboard panels 
APP_DASHBOARD = Dashboard("app", "Main dahsboard", is_default=True)
APP_DASHBOARD.add_panel(DashboardPanel("steering", title="Steering"))
APP_DASHBOARD.add_panel(DashboardPanel("balance_pid", title="Balance PID "))
APP_DASHBOARD.add_panel(DashboardPanel("sensors", title="Sensors"))

SYSTEM_DASHBOARD = Dashboard("system", "System")
SYSTEM_DASHBOARD.add_panel(DashboardPanel("cpu"))
SYSTEM_DASHBOARD.add_panel(DashboardPanel("memory"))
SYSTEM_DASHBOARD.add_panel(DashboardPanel("disk"))
SYSTEM_DASHBOARD.add_panel(DashboardPanel("power", title="Power"))
SYSTEM_DASHBOARD.add_panel(DashboardPanel("log", title="Log", user_log=True))
