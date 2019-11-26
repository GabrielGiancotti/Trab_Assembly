#Main(){
#int a, b, c;
#Console.WriteLine("Digite o valor de A: ");
#a = int.Parse(Console.ReadLine());
#Console.WriteLine("Digite o valor de B: ");
#b = int.Parse(Console.ReadLine());
#Console.WriteLine("Digite o valor de C: ");
#c = int.Parse(Console.ReadLine());
#Console.WriteLine("O delta é: " + ((b*b)-(4 * a * c)));
#Console.ReadKey();}

          .data
termoA: .space 4
termoB: .space 4
termoC: .space 4
MensagemInicial: .asciiz "Programa para calcular o DELTA \n"
MensagemA: .asciiz "Digite o a: \n"
MensagemB: .asciiz "Digite o b: \n"
MensagemC: .asciiz "Digite o c: \n"
MensagemDelta: .asciiz "O valor de delta: \n"

          .text
   #Mensagem Inicial
main: li $v0, 4
      la $a0, MensagemInicial
      syscall

   #mensagem A
      la $a0, MensagemA
      syscall
   
   #lendo o valor de a informado pelo usuário
      li $v0, 5
      syscall
      sw $v0, termoA($zero)

   #mensagem B
      li $v0, 4
      la $a0, MensagemB
      syscall
   
   #lendo o valor de b informado pelo usuário
      li $v0, 5
      syscall
      sw $v0, termoB($zero)

   #mensagem C
      li $v0, 4
      la $a0, MensagemC
      syscall
   
   #lendo o valor de c informado pelo usuário
      li $v0, 5
      syscall
      sw $v0, termoC($zero)

   #mensagem Delta
      li $v0, 4
      la $a0, MensagemDelta
      syscall

   #jogando os valores salvos na memoria em registradores
      lw $s0, termoA($zero)
      lw $s1, termoB($zero)
      lw $s2, termoC($zero)

   #realizando a funcao delta
      mul $t0, $s1, $s1        #b elevado ao quadrado
      mul $t1, $s0, $s2        #a multiplicando c
      addi $t3, $zero, 4       #jogando valor de 4 no registrador
      mul $t2, $t1, $t3        #multiplicando 4 com o resultado de algumas vezes c
      sub $a0, $t0, $t2        #b subtraído com o valor de 4 ae multiplicados
				
  #exibindo o delta
      li $v0, 1
      syscall	
      jr $ra
      
   