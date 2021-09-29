import pyodbc
from flask import Flask, request, jsonify
from flask_restful import Resource, Api


app = Flask(__name__)
objapi = Api(app)


class getUser(Resource):
    def get(self, strUsername, strPassword):
        DBfile = "C:\\HOME\\Rik\\Projects\\Python\\LiveItPY\\liveItDB.accdb"

        conn = pyodbc.connect('Driver={Microsoft Access Driver (*.mdb, *.accdb)};DBQ='+DBfile)
        cur = conn.cursor()

        SQL = "SELECT User_ID, FirstName, Username, Password, Age, Gender, Height, Weight, Activity FROM UserData WHERE UCase(Username) = '" + strUsername.upper() + "'"
        cur.execute(SQL)
        users = cur.fetchall()
        cur.close()
        conn.close()
        
        userArr = []


        if users:
            if strPassword == str(users[0][3]):
                userData = {}
                userData["id"] = users[0][0]
                userData["fName"] = users[0][1]
                userData["username"] = strUsername
                userData["password"] = strPassword
                userData["age"] = users[0][4]
                userData["gender"] = users[0][5]
                userData["height"] = users[0][6]
                userData["weight"] = users[0][7]
                userData["activity"] = users[0][8]
                userData["Error"] = ""
                userArr.append(userData)

            else:
                userData = {}
                userData["id"] = -1
                userData["fName"] = ""
                userData["username"] = ""
                userData["password"] = ""
                userData["age"] = 0
                userData["gender"] = ""
                userData["height"] = 0
                userData["weight"] = 0
                userData["activity"] = ""
                userData["Error"] = "Invalid Password"
                userArr.append(userData)
        else:
            userData = {}
            userData["id"] = -1
            userData["fName"] = ""
            userData["username"] = ""
            userData["password"] = ""
            userData["age"] = 0
            userData["gender"] = ""
            userData["height"] = 0
            userData["weight"] = 0
            userData["activity"] = ""
            userData["Error"] = "Invalid Username"
            userArr.append(userData)
        print(userArr)
        return jsonify(userArr)

class Register(Resource):
    def get(self, strFirstName, strLastName, strUsername, strPassword, intAge, strGender, intHeight, intWeight, strActivity):
        
        DBfile = "C:\\HOME\\Rik\\Projects\\Python\\LiveItPY\\liveItDB.accdb"

        conn = pyodbc.connect('Driver={Microsoft Access Driver (*.mdb, *.accdb)};DBQ='+DBfile)
        cur = conn.cursor()
        message = {}

        SQL = "SELECT Username FROM UserData WHERE UCase(Username) = '" + strUsername.upper() + "'"
        cur.execute(SQL)
        users = cur.fetchall()
        cur.close()
        conn.close()

        message_arr = []

        if users:
            message["id"] = 1
            message["Message"] = "Username Already Exists"
            
            return jsonify(message_arr.append(message))
        
        else:
            conn2 = pyodbc.connect('Driver={Microsoft Access Driver (*.mdb, *.accdb)};DBQ='+DBfile)
            cur2 = conn2.cursor()
            
            SQL = "INSERT INTO UserData (FirstName, LastName, Username, Password, Age, Gender, Height, Weight, Activity)"
            SQL = SQL + "VALUES ('" + strFirstName + "', '" + strLastName + "', '" + strUsername + "', '" 
            SQL = SQL + strPassword + "', " + intAge + ", '" + strGender + "', " + intHeight + ", " + intWeight + ", '" + strActivity + "')"
            cur2.execute(SQL)
            conn2.commit()
            cur2.close()
            conn2.close()

            message["id"] = 1
            message["message"] = "SUCCESS"
            
            return jsonify(message_arr.append(message))

class updateProfile(Resource):
    def get(self, strUsername, strFirstName, strLastName, intAge, strGender, intHeight, intWeight, strActivity):
        
        DBfile = "C:\\HOME\\Rik\\Projects\\Python\\LiveItPY\\liveItDB.accdb"


                   
        SQL = "UPDATE UserData SET FirstName = '" + strFirstName + "', Age = " + intAge + ", Gender = '" + strGender + "',"
        SQL = SQL + " Height = " + intHeight + ", Weight = " + intWeight + ", Activity = '" + strActivity + "' WHERE Username = '" + strUsername + "'"

        conn2 = pyodbc.connect('Driver={Microsoft Access Driver (*.mdb, *.accdb)};DBQ='+DBfile)
        cur2 = conn2.cursor()
        message = {}
        
        cur2.execute(SQL)
        conn2.commit()
        cur2.close()
        conn2.close()
        
        message_arr = []
        message["id"] = -1
        message["message"] = "SUCCESS"

        print(message)
        
        return jsonify(message_arr.append(message))


class getMeals(Resource):
    def get(self, strMOD, intCals, strCuisines):
        DBfile = "C:\\HOME\\Rik\\Projects\\Python\\LiveItPY\\liveItDB.accdb"

        conn = pyodbc.connect('Driver={Microsoft Access Driver (*.mdb, *.accdb)};DBQ='+DBfile)
        cur = conn.cursor() 

        arrCuisines = strCuisines.split()
        SQL = "SELECT Meal_ID, RecipeName, Link, ImageName, Calories, MealOfDay, Cuisine FROM Meals WHERE ("

        for i in range(0, len(arrCuisines)):
            SQL = SQL + "Cuisine = '" + arrCuisines[i] + "'"
            if(i != (len(arrCuisines) - 1)):
                SQL = SQL + " OR "

        SQL = SQL + ") AND MealOfDay = '" + strMOD + "' AND Calories <= " + intCals

        print(SQL)
            
        cur.execute(SQL)
        events = cur.fetchall()
        cur.close()
        conn.close()

        events_arr = []

        if events:
            for i in range (0, len(events)):
                events_dict = {}
                events_dict["id"] = events[i][0]
                events_dict["RecipeName"] = events[i][1]
                events_dict["Link"] = events[i][2]
                events_dict["ImageName"] = events[i][3]
                events_dict["Calories"] = events[i][4]
                events_dict["MealOfDay"] = events[i][5]
                events_dict["Cuisine"] = events[i][6]
                events_dict["Error"] = ""

                events_arr.append(events_dict)
        else:
            events_dict = {}
            events_dict["id"] = 0
            events_dict["RecipeName"] = ""
            events_dict["Link"] = ""
            events_dict["ImageName"] = ""
            events_dict["Calories"] = 0
            events_dict["MealOfDay"] = ""
            events_dict["Cuisine"] = ""
            events_dict["Error"] = "No events found"

            events_arr.append(events_dict)

        return jsonify(events_arr)

class chooseDailyMeals(Resource):
    def get(self, strMonth, strDay, strYear, intMealID, strMOD):
        DBfile = "C:\\HOME\\Rik\\Projects\\Python\\LiveItPY\\liveItDB.accdb"

        conn = pyodbc.connect('Driver={Microsoft Access Driver (*.mdb, *.accdb)};DBQ='+DBfile)
        cur = conn.cursor()

        strDate = strMonth + "/" + strDay + "/" + strYear

        SQL = "SELECT ID FROM DailyMeals WHERE FORMAT(DatePicked, 'Short Date') = '" + strDate + "'"
        cur.execute(SQL)
        meals = cur.fetchone()

        modID = ""

        if(strMOD == "Breakfast"):
            modID = "B_ID"
        elif(strMOD == "Lunch"):
            modID = "L_ID"
        else:
            modID = "D_ID"

        meals_arr = []
        
        if meals:
            
            mealsID = meals[0]
            
            SQL = "UPDATE DailyMeals SET " + modID + " = " + intMealID + " WHERE ID = " + str(mealsID)

            cur.execute(SQL)
            conn.commit()
            cur.close()
            conn.close()

            meals_dict = {}
            meals_dict["id"] = 0
            meals_dict["Success"] = "Success"

        
        else:
            SQL = "INSERT INTO DailyMeals(" + modID + ", DatePicked) VALUES (" + intMealID + ", Now())"

            cur.execute(SQL)
            conn.commit()
            cur.close()
            conn.close()

            meals_dict = {}
            meals_dict["id"] = 0
            meals_dict["Success"] = "Success"


        meals_arr.append(meals_dict)
        return jsonify(meals_arr)

class returnMealIDs(Resource):
    def get(self, strMonth, strDay, strYear):
        DBfile = "C:\\HOME\\Rik\\Projects\\Python\\LiveItPY\\liveItDB.accdb"

        conn = pyodbc.connect('Driver={Microsoft Access Driver (*.mdb, *.accdb)};DBQ='+DBfile)
        cur = conn.cursor()

        strDate = strMonth + "/" + strDay + "/" + strYear

        SQL = "SELECT ID, B_ID, L_ID, D_ID, W_ID FROM DailyMeals WHERE FORMAT(DatePicked, 'Short Date') = '" + strDate + "'"  
            
        cur.execute(SQL)
        events = cur.fetchall()
        cur.close()
        conn.close()

        events_arr = []

        if events:
            for i in range (0, len(events)):
                events_dict = {}
                events_dict["id"] = events[i][0]
                events_dict["B_ID"] = events[i][1]
                events_dict["L_ID"] = events[i][2]
                events_dict["D_ID"] = events[i][3]
                events_dict["W_ID"] = events[i][4]
                events_dict["Error"] = ""

                events_arr.append(events_dict)
        else:
            events_dict = {}
            events_dict["id"] = 0
            events_dict["B_ID"] = 0
            events_dict["L_ID"] = 0
            events_dict["D_ID"] = 0
            events_dict["W_ID"] = 0
            events_dict["Error"] = "No events found"

            events_arr.append(events_dict)

        return jsonify(events_arr)

class returnMeals(Resource):
    def get(self, intMealID):
        DBfile = "C:\\HOME\\Rik\\Projects\\Python\\LiveItPY\\liveItDB.accdb"

        conn = pyodbc.connect('Driver={Microsoft Access Driver (*.mdb, *.accdb)};DBQ='+DBfile)
        cur = conn.cursor()


        SQL = "SELECT Meal_ID, RecipeName, Link, ImageName, Calories, MealOfDay, Cuisine FROM Meals WHERE Meal_ID = " + intMealID  
            
        cur.execute(SQL)
        events = cur.fetchone()
        cur.close()
        conn.close()

        events_arr = []

        if events:
            events_dict = {}
            events_dict["id"] = events[0]
            events_dict["RecipeName"] = events[1]
            events_dict["Link"] = events[2]
            events_dict["ImageName"] = events[3]
            events_dict["Calories"] = events[4]
            events_dict["MealOfDay"] = events[5]
            events_dict["Cuisine"] = events[6]
            events_dict["Error"] = ""

            events_arr.append(events_dict)
        else:
            events_dict["id"] = 0
            events_dict["RecipeName"] = ""
            events_dict["Link"] = ""
            events_dict["ImageName"] = ""
            events_dict["Calories"] = 0
            events_dict["MealOfDay"] = ""
            events_dict["Cuisine"] = ""
            events_dict["Error"] = "No events found"

            events_arr.append(events_dict)

        return jsonify(events_arr)


class getWorkouts(Resource):
    def get(self):
        DBfile = "C:\\HOME\\Rik\\Projects\\Python\\LiveItPY\\liveItDB.accdb"

        conn = pyodbc.connect('Driver={Microsoft Access Driver (*.mdb, *.accdb)};DBQ='+DBfile)
        cur = conn.cursor() 

        SQL = "SELECT Workout_ID, Title, Link, ImageName, Calories, FORMAT(Time, 'Short Time') FROM Workouts"
            
        cur.execute(SQL)
        events = cur.fetchall()
        cur.close()
        conn.close()

        events_arr = []

        if events:
            for i in range (0, len(events)):
                events_dict = {}
                events_dict["id"] = events[i][0]
                events_dict["Title"] = events[i][1]
                events_dict["Link"] = events[i][2]
                events_dict["ImageName"] = events[i][3]
                events_dict["Calories"] = events[i][4]
                events_dict["Time"] = events[i][5]
                events_dict["Error"] = ""

                events_arr.append(events_dict)
        else:
            events_dict = {}
            events_dict["id"] = 0
            events_dict["Title"] = ""
            events_dict["Link"] = ""
            events_dict["ImageName"] = ""
            events_dict["Calories"] = 0
            events_dict["Time"] = ""
            events_dict["Error"] = "No events found"

            events_arr.append(events_dict)

        return jsonify(events_arr)

class chooseDailyWorkouts(Resource):
    def get(self, strMonth, strDay, strYear, intWorkoutID):
        DBfile = "C:\\HOME\\Rik\\Projects\\Python\\LiveItPY\\liveItDB.accdb"

        conn = pyodbc.connect('Driver={Microsoft Access Driver (*.mdb, *.accdb)};DBQ='+DBfile)
        cur = conn.cursor()

        strDate = strMonth + "/" + strDay + "/" + strYear

        SQL = "SELECT ID FROM DailyMeals WHERE FORMAT(DatePicked, 'Short Date') = '" + strDate + "'"
        cur.execute(SQL)
        meals = cur.fetchone()

        meals_arr = []
        
        if meals:
            
            mealsID = meals[0]
            
            SQL = "UPDATE DailyMeals SET W_ID = " + intWorkoutID + " WHERE ID = " + str(mealsID)

            cur.execute(SQL)
            conn.commit()
            cur.close()
            conn.close()

            meals_dict = {}
            meals_dict["id"] = 0
            meals_dict["Success"] = "Success"

        
        else:
            SQL = "INSERT INTO DailyMeals(W_ID, DatePicked) VALUES (" + intMealID + ", Now())"

            cur.execute(SQL)
            conn.commit()
            cur.close()
            conn.close()

            meals_dict = {}
            meals_dict["id"] = 0
            meals_dict["Success"] = "Success"


        meals_arr.append(meals_dict)
        return jsonify(meals_arr)

class returnWorkouts(Resource):
    def get(self, intWorkoutID):
        DBfile = "C:\\HOME\\Rik\\Projects\\Python\\LiveItPY\\liveItDB.accdb"

        conn = pyodbc.connect('Driver={Microsoft Access Driver (*.mdb, *.accdb)};DBQ='+DBfile)
        cur = conn.cursor()


        SQL = "SELECT Workout_ID, Title, Link, ImageName, Calories, FORMAT(Time, 'Short Time') FROM Workouts WHERE Workout_ID = " + intWorkoutID  
            
        cur.execute(SQL)
        events = cur.fetchone()
        cur.close()
        conn.close()

        events_arr = []

        if events:
            events_dict = {}
            events_dict["id"] = events[0]
            events_dict["Title"] = events[1]
            events_dict["Link"] = events[2]
            events_dict["ImageName"] = events[3]
            events_dict["Calories"] = events[4]
            events_dict["Time"] = events[5]
            events_dict["Error"] = ""

            events_arr.append(events_dict)
        else:
            events_dict["id"] = 0
            events_dict["Title"] = ""
            events_dict["Link"] = ""
            events_dict["ImageName"] = ""
            events_dict["Calories"] = 0
            events_dict["Time"] = ""
            events_dict["Error"] = "No events found"

            events_arr.append(events_dict)

        return jsonify(events_arr)



objapi.add_resource(getUser, '/getUser/<strUsername>/<strPassword>')
objapi.add_resource(Register, "/Register/<strFirstName>/<strUsername>/<strPassword>/<intAge>/<strGender>/<intHeight>/<intWeight>/<strActivity>")
objapi.add_resource(updateProfile, "/updateProfile/<strUsername>/<strName>/<intAge>/<strGender>/<intHeight>/<intWeight>/<strActivity>")
objapi.add_resource(getMeals, "/getMeals/<strMOD>/<intCals>/<strCuisines>")
objapi.add_resource(chooseDailyMeals, "/chooseDailyMeals/<strMonth>/<strDay>/<strYear>/<intMealID>/<strMOD>")
objapi.add_resource(returnMealIDs, "/returnMealIDs/<strMonth>/<strDay>/<strYear>")
objapi.add_resource(returnMeals, "/returnMeals/<intMealID>")
objapi.add_resource(getWorkouts, "/getWorkouts")
objapi.add_resource(chooseDailyWorkouts, "/chooseDailyWorkouts/<strMonth>/<strDay>/<strYear>/<intWorkoutID>")
objapi.add_resource(returnWorkouts, "/returnWorkouts/<intWorkoutID>")
#app.run(debug=True)
app.run(host='0.0.0.0', port=5000)

    





