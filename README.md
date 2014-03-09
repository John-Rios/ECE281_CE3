ECE281_CE3
==========

Computer Exercise 3

Testbench Results for the Mealy Machine:
![Mealy] (https://raw.github.com/John-Rios/ECE281_CE3/master/Mealy_Sim_Results.JPG)
These results are correct because they behave as expected according to the testbanch. The testbench was written in order to test the situation presented in step seven of the CE3 handout. The simulation results are the desired outcomes as the VHDL produces the proper outputs and the testbench simulation results match the given image in the CE3 handout. These results suggest the mealy machine VHDL code is correct. 


Testbench Results for the Moore Machine:
![Moore] (https://raw.github.com/John-Rios/ECE281_CE3/master/Moore_Sim_Results.JPG)
These results are correct because they behave as expected according to the testbanch. The testbench was written in order to test the situation presented in step seven of the CE3 handout. The simulation results are the desired outcomes as the VHDL produces the proper outputs and the testbench simulation results match the given image in the CE3 handout. These results suggest the moore machine VHDL code is correct. 

________________________________________________

Answers to the questions in the VHDL shells:
 -Moore Shell Question: is reset synchronous or asynchronous? -Answer: the reset is synchronous because it requires the rising edge and the reset to be true.
 -Mealy Shell Question: Will it (the next state process) be different from your Moore Machine? -Answer: No, the next-state code is the same. It is the output code will be different. 
_______________________________________________
Debugging: 

  I encountered several errors and issues while attampting to complete this computer exercise. I will begin with the errors from the moore machine design and code. After writing the VHDL code, the simulation results showed that the elevator would go travel up to the fourth floor properly and then stay there infinitely. Looking at the simulation results it was apparent that the state changes were out of sync with the clock cycles somehow. I attempted changing the "wait" after the state change lines of code to "wait for 10 ns" however, this did not correct the problem. My next thought was to make everything change based on clock cycles. I changed every "wait" to a "wait for clk_period". I had variation in the number of clock cycles at different points in order to satisfy the simulation scenario. This fixed the problem as the states all changed insync. the elevator now moved back down to the first floor after reaching the fourth and stopping for two clock periods. 
  
  Next was the debugging of the mealy machine. After reviewing the course book I saw that the majority of the code for the mealy machine and the moore machine is the same. The only difference is the output. This meant the only thing I needed to write from scratch was the output and so I copied and pasted the moore code into my mealy file. the first error I ran into was I forgot to rename all the references to "moore" to "mealy" within the code. Next I wrote the outputs and the testbench, which again was the same with only the difference of the outputs. My simulation results were showing that the elevato would return to the firt floor after increasing a level. It would go 1-2-1-3-1-4-1 and then remain on the first floor. I began analyzing my testbench. However, soon I realized that the problem existed within my actual VHDL code and not the phasing of the simulation. I editied the outputs of the VHDL code. initially I forgot to include the value of 'stop' needed to change states. My code went from [0001" when (floor_state = floor2 and up_down = '0')] to ["0001" when (floor_state = floor2 and up_down = '0' and stop = '0')]. including that stop needed to be false to advance was required. However, this did not correct the error of my simulation results. After more analysis I realized I coded the "floor" output wrong aswell. I said that the floor would only be on the first floor if the elevator is on the first floor and is stopped on that floor. This is not true as the elevator could be on the first floor and not be stopped there. I therefore changed my code from ["0001" when (floor_state = floor1 and stop = '1')] to ["0001" when (floor_state = floor1)]. This corrected the problem. My simulatio results were then correct and matched the moore results. 
  
  A few more minor issues and errors were encountered. These were on the scale of forgotten ";" and mispelled words within the code. The program would point out the errors and tell me what was wrong. Correcting these involved minimal effort. 
_______________________________
  
Documentation:
I referred to my clas notes and the course text. No other help was received. 

