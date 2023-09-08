# VectorProcessor
Vector Processor for fast Convolutions
<br>
Compnents 
<br>
   32 bit Fp Dadda multiplier 
   <br>
   32 bit Fp adder
   <br>
   Full adder 
   <br>
   Compressor
     <br>
   Convolutional unit
   <br>

Instruction is 
<br>
<img src="custominst.png" alt="Custom intsruction " width="300"/>
<br>
rd , rs1,rs2 are destination ,source registers 1 and 2 respectively
<br>
Aluop tells which operations to peform add or multiply 
<br>
conv bits tells if convolution is to be prfomed and for how many elements lsb if 1 we do convolutions and rest 2 
<br>
tell no of elements so 111 is 3 elements convolutions
<br>



   
