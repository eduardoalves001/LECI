months = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
monthsFull = ["January","February","March","April","May","June","July","August","September","October","November","December"]
dates = ["Oct24","Oct25","Oct26","Oct27","Oct28",
        "Oct29","Oct30","Oct31","Nov1","Nov2","Nov3","Nov4","Nov5","Nov6","Nov8","Nov9","Nov10","Nov11","Nov12","Nov13","Nov14","Nov15","Nov16","Nov17","Nov18","Nov19","Nov20","Nov21","Nov22","Nov24","Nov25","Nov26","Nov27","Nov28","Nov29","Nov30",
        "Dec1","Dec2","Dec4","Dec5","Dec6","Dec7","Dec8","Dec11","Dec12","Dec13","Dec14","Dec15","Dec16","Dec17","Dec18","Dec19","Dec20","Dec21","Dec22","Dec23","Dec25","Dec26","Dec27","Dec28","Dec29","Dec30","Dec31",
        "Jan1","Jan2","Jan3","Jan4","Jan5","Jan6","Jan7","Jan8","Jan9","Jan10","Jan11","Jan12","Jan13","Jan14","Jan15","Jan16","Jan17","Jan18","Jan19","Jan20","Jan21","Jan22","Jan23","Jan24","Jan25","Jan26","Jan27","Jan28","Jan29","Jan30","Jan31",
        "Feb1","Feb2","Feb3","Feb4","Feb5","Feb6","Feb7","Feb8","Feb9","Feb10","Feb11","Feb12","Feb13","Feb14","Feb15","Feb22","Feb23","Feb24","Feb25","Feb26","Feb27","Feb28","Feb29",
        "Mar1","Mar2","Mar3","Mar4","Mar5","Mar6","Mar7","Mar8","Mar9","Mar10","Mar11","Mar12","Mar13","Mar14","Mar15","Mar16","Mar17","Mar18","Mar19","Mar20","Mar21","Mar22","Mar23","Mar24","Mar25","Mar26","Mar27","Mar28","Mar29","Mar30","Mar31",
        "Apr1","Apr2","Apr3","Apr4", "Apr5","Apr6","Apr7"
         ]

def getDateValue(date):
    month = getDateMonth(date)
    day = getDateDay(date)
    if month >= 10:
        year = 2023
    if month < 10:
        year = 2024
    return (day, month, year)
def getShortDate(monthday):
    month, day = monthday.split(" ")
    return month+(str(day))
def getDateMonth(date):
    month = date[0:3]
    monthNum = months.index(month) + 1
    return (monthNum)
def getDateDay(date):
    day = date[3:]
    return (int(day))

def date2Full(date):
    month=getDateMonth(date)
    day = getDateDay(date)
    post = "th"
    year = 2024
    if day == 1:
        post="st"
    if day == 2:
        post="nd"
    if day == 3:
        post="rd"
    if day == 21:
        post="st"
    if day == 22:
        post="nd"
    if day == 23:
        post="rd"
    if day == 31:
        post="st"
    if month >= 10:
        year= 2023
    return monthsFull[month-1]+" "+str(day)+post + ", "+str(year)