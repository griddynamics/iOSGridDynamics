var start = new Date().getTime();

var target = UIATarget.localTarget();
target.setDeviceOrientation(UIA_DEVICE_ORIENTATION_PORTRAIT);
                                     
target.frontMostApp().mainWindow().elements()["searchBar"].searchBars()[0].searchBars()[0].tap();
                                     
UIALogger.logMessage("Searching for cats");
target.delay(0.2);
target.frontMostApp().keyboard().typeString("Cats\n");
target.delay(2);

UIALogger.logMessage("Scrolling cats");
target.frontMostApp().mainWindow().collectionViews()[0].cells()[5].scrollToVisible();
                                     
target.dragFromToForDuration({x:177.50, y:314.50}, {x:275.50, y:0.50}, 1.0);
                                     
target.frontMostApp().mainWindow().collectionViews()[0].dragInsideWithOptions({startOffset:{x:0.51, y:0.59}, endOffset:{x:0.73, y:0.11}});

    
var end = new Date().getTime();
var time = (end - start)/1000;
UIALogger.logMessage('Execution time: ' + time + 's');

if(time < 15) {
    UIALogger.logPass("Search for cats");
}
else {
    UIALogger.logFail("Execution of cats serach is too long");
}