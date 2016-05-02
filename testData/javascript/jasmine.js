describe( "distance converter", function () {
    it("converts inches to centimeters", function () {
        expect(Convert(12, "in").to("cm")).toEqual(30.48);
    });

    it("converts centimeters to yards", function () {
        expect(Convert(2000, "cm").to("yards")).toEqual(21.87);
    });
});
