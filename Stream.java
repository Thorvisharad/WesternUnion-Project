package com.westernunion.base;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class Stream {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.setProperty("webdriver.chromedriver", "C:\\Rutu\\chromedriver_win32\\chromedriver.exe");

		WebDriver driver = new ChromeDriver();

		driver.get("https://www.flipkart.com/");

		System.out.println(driver.getCurrentUrl());
		driver.manage().window().maximize();
		
		
		List<WebElement> links = driver.findElements(By.tagName("a")); // Here is List is collection

		System.out.println(links.size());

		//Printing linkTexts using for..each loop(Before Java8)

		for (WebElement link : links) {

			System.out.println(link.getText() + " - " + link.getAttribute("href"));
			//System.out.println(link.getText() + " - " + link.getAttribute("href"));

		}

		//Printing linkTexts using lambda expression

		//links.forEach(link -> System.out.println(link.getText()));

		//Processing elements using stream -> filter

		long workingLinks=links.stream().filter(link->link.getAttribute("href")!=null).count();

		System.out.println("Working link:"+workingLinks);

		driver.close();

	}

}
