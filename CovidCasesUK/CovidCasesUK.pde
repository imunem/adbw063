// Daily UK COVID-19 Cases (48 day period: 31/01/20 - 13/03/20)
String[] date;
int[] dateCount;
int[] cumulativeCases;


void setup() {
  size(900, 1000);
  textAlign(LEFT, TOP);
  strokeWeight(1.0);

  String[] textLines = loadStrings("Data.csv");

  // Arrays for the data, without header line
  date = new String[textLines.length];
  dateCount = new int[textLines.length];
  cumulativeCases = new int[textLines.length];

  // Iterate and store data values
  for (int i=1; i<textLines.length; i++) {

    // Split lines into values separated by commas
    String[] values = split(textLines[i], ",");

    date[i] = values[0];
    dateCount[i] = int(values[1]);
    cumulativeCases[i] = int(values[2]);
  }
}

void draw()
{
  background(255);
  float yPos= 2;
  ;
  // Show the number of existing and new cases over a 47 day period
  for (int i=1; i<=43; i=i+1)
  {
    fill(0);
    text( date[i], 14, yPos+2);

    noStroke();
    fill(#AFA8A9);
    rect(80, yPos+2, dateCount[i]*11, 14);
    fill(0, 0, 255);
    text("+"+dateCount[i], 81, yPos+2);


    noFill();
    stroke(0);
    rect(80, yPos+2, cumulativeCases[i]*11, 14);


    yPos += 18;
  }

  fill(1);
  text("UK Daily COVID-19 Cases (31/01/2020 - 13/03/2020)", 200, 800);

  fill(0, 0, 255);
  text("New Daily Cases", 200, 850);
  fill(#AFA8A9);
  rect(350, 850, 14, 14);

  fill(#030303);
  text("Cumulative Daily Cases", 200, 900);
  noFill();
  rect(350, 900, 14, 14);
}
