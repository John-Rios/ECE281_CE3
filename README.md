ECE281_CE3
==========

Computer Exercise 3

Testbench Results for the Mealy Machine:
![Mealy] (https://raw.github.com/John-Rios/ECE281_CE3/master/Mealy_Sim_Results.JPG)
These results are correct because they behave as expected according to the testbanch. The testbench was written in order to test the situation presented in step seven of the CE3 handout. The simulation results are the desired outcomes as the VHDL produces the proper outputs and the testbench simulation results match the given image in the CE3 handout. These results suggest the mealy machine VHDL code is correct. 


Testbench Results for the Moore Machine:
![Moore] (https://raw.github.com/John-Rios/ECE281_CE3/master/Moore_Sim_Results.JPG)
These results are correct because they behave as expected according to the testbanch. The testbench was written in order to test the situation presented in step seven of the CE3 handout. The simulation results are the desired outcomes as the VHDL produces the proper outputs and the testbench simulation results match the given image in the CE3 handout. These results suggest the moore machine VHDL code is correct. 

Answers to the questions in the VHDL shells:
 -Moore Shell Question: is reset synchronous or asynchronous? -Answer: the reset is synchronous because it requires the rising edge and the reset to be true.
 -Mealy Shell Question: Will it (the next state process) be different from your Moore Machine? -Answer: No, the next-state code is the same. It is the output code will be different. 

Debugging: 
  I encountered several errors and issues while attampting to complete this computer exercise. I will begin with the errors from the moore machine design and code. After writing the VHDL code, the simulation results showed that the elevator would go travel up to the fourth floor properly and then stay there infinitely. Looking at the simulation results it was apparent that the state changes were out of sync with the clock cycles somehow. I attempted changing the "wait" after the state change lines of code to "wait for 10 ns" however, this did not correct the problem. My next thought was to make everything change based on clock cycles. I changed every "wait" to a "wait for clk_period". I had variation in the number of clock cycles at different points in order to satisfy the simulation scenario. This fixed the problem as the states all changed insync. the elevator now moved back down to the first floor after reaching the fourth and stopping for two clock periods. 
  Next was the debugging of the mealy machine. 

