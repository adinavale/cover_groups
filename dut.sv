`timescale 1ns/10ps
// prints out the state values
//
module dut(intf.idut ix);

logic [3:0] old_state;

default clocking @(posedge(ix.clk));

endclocking

always @(posedge(ix.clk)) begin
  $display(ix.state);
end

always @ (ix.state) begin
  case(ix.state) 
    1: begin
        assert (old_state == 0 || old_state == 3 || old_state == 5) 
        else begin
          $display("Error: Legal transition to state 1 can only occur from old_state 0, 3, or 5");
        end
      end
    2: begin
        assert (old_state == 1 || old_state == 8)
        else begin
          $display("Error: Legal transition to state 2 can only occur from old_state 1 or 8");
        end
    end
    3: begin
        assert (old_state == 2)
        else begin
          $display("Error: Legal transition to 3 can only occur from old_state 2");
        end
    end
    4: begin
        assert (old_state == 1 || old_state == 8)
        else begin
          $display("Error: Legal transition to 4 can only occur from old_state 1 or 8");
        end
    end
    5: begin
        assert (old_state == 3 || old_state == 4)
        else begin
          $display("Error: Legal transition to 5 can only occur from old_state 3 or 4");
        end
    end
    6: begin
        assert (old_state == 5)
        else begin
          $display("Error: Legal transition to 6 can only occur from old_state 5");
        end
    end
    7: begin
        assert (old_state == 6)
        else begin
          $display("Error: Legal transition to 7 can only occur from old_state 6");
        end
    end
    8: begin
        assert (old_state == 7 || old_state == 9)
        else begin
          $display("Error: Legal transition to 8 can only occur from old_state 7 or 9");
        end
    end
    9: begin
        assert (old_state == 8)
        else begin
          $display("Error: Legal transition to 9 can only occue from old_state 8");
        end
    end
    10: begin
        assert(old_state == 8)
        else begin
          $display("Error: Legal transition to 10 can only occur from old_state 8");
        end
    end
  endcase

  old_state = ix.state;
end


endmodule
