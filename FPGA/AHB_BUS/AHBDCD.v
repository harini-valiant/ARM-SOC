//Decoder for AHB-Lite Bus . It helps in mapping the address to the slave devices. It also generates the select signals for the slaves and the MUX_SEL signal for the MUX which selects the data from the slaves to be sent to the master.
module AHBDecoder(
  input wire [31:0] HADDR,
  
  output wire HSEL_S0,
  output wire HSEL_S1,
  output wire HSEL_S2,
  output wire HSEL_S3,
  output wire HSEL_S4,
  output wire HSEL_S5,
  output wire HSEL_S6,
  output wire HSEL_S7,
  output wire HSEL_S8,
  output wire HSEL_S9,
  output wire HSEL_NOMAP,
  
  output reg [3:0] MUX_SEL
    );

reg [15:0] dec;

assign HSEL_S0 = dec[0];   
assign HSEL_S1 = dec[1];   	
assign HSEL_S2 = dec[2];   
assign HSEL_S3 = dec[3];   
assign HSEL_S4 = dec[4];   
assign HSEL_S5 = dec[5];   
assign HSEL_S6 = dec[6];   
assign HSEL_S7 = dec[7];   
assign HSEL_S8 = dec[8];   
assign HSEL_S9 = dec[9];   
assign HSEL_NOMAP = dec[15]; 
    
always@*
begin

  case(HADDR[31:24])
    8'h00: 						//MEMORY MAP --> 0x0000_0000 to 0x00FF_FFFF  16MB
      begin
        dec = 16'b0000_0000_00000001;
        MUX_SEL = 4'b0000;
      end
    8'h50: 						//MEMORY MAP --> 0x5000_0000 to 0x50FF_FFFF  16MB 
      begin
        dec = 16'b0000_0000_0000_0010;
        MUX_SEL = 4'b0001;
      end
    8'h51: 						//MEMORY MAP --> 0x5100_0000 to 0x51FF_FFFF  16MB
      begin
        dec =16'b0000_0000_0000_0100;
        MUX_SEL = 4'b0010;
      end   
    8'h52:  					//MEMORY MAP --> 0x5200_0000 to 0x52FF_FFFF  16MB
      begin
        dec = 16'b0000_0000_0000_1000;
        MUX_SEL = 4'b0011;
      end
    8'h53: 						//MEMORY MAP --> 0x5300_0000 to 0x53FF_FFFF  16MB 
      begin
        dec = 16'b0000_0000_0001_0000;
        MUX_SEL = 4'b0100;
      end
    8'h54:						//MEMORY MAP --> 0x5400_0000 to 0x54FF_FFFF  16MB  
      begin
        dec = 16'b0000_0000_0010_0000;
        MUX_SEL = 4'b0101;
      end
    8'h55:						//MEMORY MAP --> 0x5500_0000 to 0x55FF_FFFF  16MB 
      begin
        dec = 16'b0000_0000_0100_0000;
        MUX_SEL = 4'b0110;
      end
    8'h56:						//MEMORY MAP --> 0x5600_0000 to 0x56FF_FFFF  16MB 
      begin
        dec = 16'b0000_0000_1000_0000;
        MUX_SEL = 4'b0111;
      end
    8'h57: 						//MEMORY MAP --> 0x5700_0000 to 0x57FF_FFFF  16MB
      begin
        dec = 16'b0000_0001_0000_0000;
        MUX_SEL = 4'b1000;
      end
    8'h58:						//MEMORY MAP --> 0x5800_0000 to 0x58FF_FFFF  16MB 
      begin
        dec = 16'b0000_0010_0000_0000;
        MUX_SEL = 4'b1001;
      end
    default: //NOMAP
      begin
        dec = 16'b1000_0000_00000000;
        MUX_SEL = 4'b1111;
      end
  endcase
end

endmodule
