global class OpenWeatherAPISchedule implements Schedulable{
    global String apiKey='c6f84b1b9b6a08845d630e404082fbc2';
    global void execute(SchedulableContext sc){
        OpenWeatherAPI.getWeather(apiKey);
    }
}