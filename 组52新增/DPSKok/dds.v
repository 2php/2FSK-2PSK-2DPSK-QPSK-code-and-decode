module dds(//采用直接数字合成(Direct Digital Synthesis)
    sine,
    clk,
    rst_n,
	 phase,
	cos
    );
       input [9:0] phase;
		 wire [9:0]temp;
       output signed [7:0]sine; 
	output signed [7:0]cos;	 //输出叠加的正弦波
       input rst_n;
       input clk;  
       wire [15:0] rom_ad;   //16bit内部连接线，传递相位增量（频率控制字的整数倍）
       wire [9:0] address;   //10bit
       wire signed [7:0] sine1;
		wire signed [7:0] sine2; //8位大小的存储器阵列
       assign sine=sine1;
		  assign cos=sine2;
		  assign temp=phase+address;
		 
//M=2^N=2^16=65536（N控制频率分辨率，fc/M）,通过相位增量K（频率控制字）控制输出频率。fout=K*fclk/M
//通过查表输出正弦波，一个周期内，1024（10位）点 X 8bit(幅度量化精度)
//fclk=100MHz(10ns)
//10MHz         //带参数的模块实例化
       adder#(.fcw(3277)) uut0(  //10MHz-->6554（频率控制字），实例化adder模块，uut0
       .clk(clk),
       .rst(rst_n),
       .sum(rom_ad)      //rom_ad,16bit大小内部连接线
       );
        assign address=rom_ad [15:6];//address,10bit取rom_ad高10位作为地址，与表中1024个值一一对应。
      
        rom_sine0 rom0(     //IP核
       .address(address),//输入10位的地址，查出正弦波表对应的幅度值
       .clock(clk),         
       .q(sine1)        //输出结果
       );
		   rom_sine0 rom1(     //IP核
       .address(temp),//输入10位的地址，查出正弦波表对应的幅度值
       .clock(clk),         
       .q(sine2)        //输出结果
       );
		 
		 
		 
		 
endmodule