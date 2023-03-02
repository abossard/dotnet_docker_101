using api;

namespace tests;

public class UnitTest1
{
    [Fact]
    public void Test1()
    {
        var weatherForecast = new WeatherForecast();
        Assert.Null(weatherForecast.Summary);
    }
    
    [Fact]
    public void Test2()
    {
        var weatherForecast = new WeatherForecast();
        Assert.NotEmpty(weatherForecast.Summary);
    }
}