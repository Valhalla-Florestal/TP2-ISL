module substantivo(reset,ok,clock,fim,state,next_state,nota,tipo);
    input wire reset, ok, clock,nota[4:0];
    output reg fim, state[4:1],next_state[4:1],tipo[1:0];

    parameter inicio = 2'b01;
    parameter concreto = 4'b0111;
    parameter abstrato = 4'b1001;
    parameter nomep = 4'b1010;
    parameter nota_inv1 = 4'b0000;
    parameter nota_inv2 = 4'b0001;

    
    always @(posedge clock) begin
        if(reset) state = inicio;
        else state = next_state;
        always @(posedge ok) begin
            always @(state) begin
                case(state)
                concreto:
                begin
                    if(ok and concreto) next_state = concreto;
                    else if(ok and abstrato) next_state = abstrato;
                    else if(ok and nomep) next_state = nomep;
                    else if(ok and (nota_inv1 or nota_inv2)) begin
                    next_state = concreto;
                    fim = 1;
                    else next_state = inicio;
                end
                abstrato:
                begin
                    if(ok and abstrato) next_state = abstrato;
                    else if(ok and concreto) next_state = concreto;
                    else if(ok and nomep) next_state = nomep;
                    else if(ok and (nota_inv1 or nota_inv2)) begin
                        next_state = abstrato;
                        fim = 1;
                    else next_state = inicio;
                end
                nomep:
                begin
                    if(ok and nomep) next_state = nomep;
                    else if(ok and abstrato) next_state = abstrato;
                    else if(ok and concreto) next_state = concreto;
                    else if(ok and (nota_inv1 or nota_inv2)) begin
                        next_state = nomep;
                        fim = 1; 
                    else next_state = inicio;
                end
                inicio:
                begin  
                    if(ok and nomep) next_state = nomep;
                    else if(ok and abstrato) next_state = abstrato;
                    else if(ok and concreto) next_state = concreto;
                    else if(ok and (nota_inv1 or nota_inv2)) begin
                        next_state = inicio;
                        fim = 1; 
                    else next_state = inicio;
                end
            end
        end
    end        