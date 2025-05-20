# 4-full-adder

## 🔹 O que é um Full Adder?

Um **Full Adder (Somador Completo)** é um circuito lógico combinacional que soma **três bits**:

* Dois bits de entrada: `A` e `B`
* Um **carry-in** (`Cin`): o "vai um" da etapa anterior (menos significativa)

Ele gera dois resultados:

* **Soma (S)**: resultado da soma dos três bits
* **Carry-out (Cout)**: "vai um" para a próxima etapa (mais significativa)

---

## 🔹 O que é um 4-bit Full Adder?

É a junção de **quatro Full Adders** conectados em série (em cascata), capazes de somar dois números binários de 4 bits:
`A[3:0]` + `B[3:0]` + um `carry-in` inicial (geralmente 0).

### Entradas:

* `A[3:0]`: número binário de 4 bits
* `B[3:0]`: outro número de 4 bits
* `Cin`: carry-in (geralmente 0)

### Saídas:

* `Sum[3:0]`: resultado da soma
* `Cout`: carry-out final (se a soma ultrapassar 4 bits)

---

## 🔹 Diagrama Conceitual

```
 Cin ──►[FA0]──►[FA1]──►[FA2]──►[FA3]──► Cout
         ↓       ↓       ↓       ↓
       Sum0    Sum1    Sum2    Sum3
```

---

## 🔹 Implementação em Verilog (Exemplo)

### Módulo do Full Adder:

```verilog
module full_adder (
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);
    assign Sum  = A ^ B ^ Cin;
    assign Cout = (A & B) | (A & Cin) | (B & Cin);
endmodule
```

### Módulo do 4-bit Full Adder:

```verilog
module four_bit_adder (
    input  [3:0] A,
    input  [3:0] B,
    input        Cin,
    output [3:0] Sum,
    output       Cout
);
    wire C1, C2, C3;

    full_adder FA0 (A[0], B[0], Cin,  Sum[0], C1);
    full_adder FA1 (A[1], B[1], C1,   Sum[1], C2);
    full_adder FA2 (A[2], B[2], C2,   Sum[2], C3);
    full_adder FA3 (A[3], B[3], C3,   Sum[3], Cout);
endmodule
```

---

## 🔹 Exemplo de Soma

Se `A = 0101` (5) e `B = 0011` (3), com `Cin = 0`, o somador dará:

* `Sum = 1000` (8)
* `Cout = 0`

---

## 🔹 Aplicações

* Somadores de processadores (ALU)
* Contadores binários
* Operações matemáticas em FPGAs e ASICs
