IFORT=ifort -std08 -O3 -check bounds -coarray
SRC=src/main.F90
RECTANGLE_SRC=src/rectangle.F90
TRAPEZOID_SRC=src/trapezoid.F90
FUNCTIONS_SRC=src/functions.F90
OUT=main

build: $(SRC) $(FUNCTIONS_SRC) $(RECTANGLE_SRC) $(TRAPEZOID_SRC)
	$(IFORT) $(FUNCTIONS_SRC) $(RECTANGLE_SRC) $(TRAPEZOID_SRC) $(SRC) -o $(OUT)

test: $(OUT)
	./$(OUT)

clean:
	rm -rf *.o $(OUT) *.mod