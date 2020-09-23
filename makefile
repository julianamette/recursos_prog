.PHONY: default help objects executable all clean

FC = gfortran

SOURCE_F90 = $(wildcard *.f90)
OBJECTS_F90 = $(patsubst %.f90, %.o, $(SOURCE_F90))
EXECUTABLE = main.out 

default: all
objects: $(OBJECTS_F90)
executable: $(EXECUTABLE)
all: objects executable

%.o: %.f90 
	$(FC) -c -o $@ $^

$(EXECUTABLE): $(OBJECTS_F90)
	$(FC) -o $@ $^
clean:
	rm $(OBJECTS_F90) $(EXECUTABLE)
