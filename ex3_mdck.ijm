function get_nuclei(input_path, filename, output_path){
    open(input_path + filename);
    run("Split Channels");
    selectImage(filename + " (blue)");
    close();
    selectImage(filename + " (red)");
    close();
    selectImage(filename + " (green)");
    setOption("BlackBackground", true);
    run("Convert to Mask");
    run("Fill Holes");
    run("Watershed");
    run("Analyze Particles...", "size=50-Infinity circularity=0.25-1.00 show=Outlines display clear summarize");
    saveAs("Results", output_path + filename + ".csv");
    saveAs("Tiff", output_path + filename + ".tif");
    close();
    selectImage(filename + " (green)");
    close();
}

root = "D:/Program/Bio/EX3/";
input_path = root + "MDCK/";
output_path = root + "Result/";

list = getFileList(input_path);
for(i = 0; i < list.length; i++){
    get_nuclei(input_path, list[i], output_path);
}