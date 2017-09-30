# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application:
    In my lib folder, the cli.rb file allows for user input and interaction with the application.

- [x] Pull data from an external source:

    In this project, I use Nokogiri and Open-URI to scrape data from http://www.airfarewatchdog.com/top-50-fares/

- [x] Implement both list and detail views:

    This first information the user receives is a list of flight deals from the above site. When the user is prompted for input the second time, he/she will then see information regarding details of one of the flights. This information was pulled from a separate webpage that is scraped only when the user asks for more details.
