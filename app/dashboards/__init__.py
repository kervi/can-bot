""" bootstrap your kervi dashboards here """
from kervi.dashboard import Dashboard, DashboardPanel

#Create the dashboards for your Kervi application here.
#Standard dashboard with several panels where sensors are placed.
#Each sensor create links to one or more dashboard panels 
APP_DASHBOARD = Dashboard("app", "Main dahsboard", is_default=True)
APP_DASHBOARD.add_panel(DashboardPanel("steering", columns=2, rows=1, title="Steering"))
APP_DASHBOARD.add_panel(DashboardPanel("balance_pid", columns=2, rows=3, title="Balance PID "))
APP_DASHBOARD.add_panel(DashboardPanel("sensors", columns=2, rows=2, title="Sensors"))

SYSTEM_DASHBOARD = Dashboard("system", "System")
SYSTEM_DASHBOARD.add_panel(DashboardPanel("cpu", columns=2, rows=2))
SYSTEM_DASHBOARD.add_panel(DashboardPanel("memory", columns=2, rows=2))
SYSTEM_DASHBOARD.add_panel(DashboardPanel("disk", columns=1, rows=2))
SYSTEM_DASHBOARD.add_panel(DashboardPanel("power", columns=1, rows=1, title="Power"))
SYSTEM_DASHBOARD.add_panel(DashboardPanel("log", columns=2, rows=2, title="Log", user_log=True))
