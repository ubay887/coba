 # ! / b i n / b a s h 
 
 c l e a r 
 
 r m   t m p p r o x y . l i s t   2 >   / d e v / n u l l 
 
 p r i n t f   " G e t t i n g   P r o x y . . " 
 
 p r o x y = $ ( c u r l   " h t t p s : / / w w w . u s - p r o x y . o r g / "   - s   |   g r e p   - P o   ' ( ? < = < t r > < t d > ) [ ^ < ] * | ( ? < = < / t d > < t d > ) [ ^ < ] * '   |   s e d   ' s / [ ^ 0 - 9 . ] * / / g '   |   s e d   ' / ^ \ s * $ / d '   |   a w k   ' O R S = N R % 2 ? F S : R S '   |   t r   "   "   " : "   > >   t m p p r o x y . l i s t ) 
 
 i f   [ [   - f   " t m p p r o x y . l i s t "   ] ]   ;   t h e n 
 
 p r i n t f   " D o n e \ n " 
 
 p r i n t f   " G e t t i n g   L i v e   P r o x y . . \ n " 
 
 e l s e 
 
         p r i n t f   " F a i l e d \ n " 
 
         e x i t 
 
 f i 
 
 g e t p r o x y l i v e ( ) { 
 
 r m   s o u r c e   2 >   / d e v / n u l l 
 
 g e t c o d e = $ ( c u r l   - X   P O S T   - s   - d   " l i s t = $ p r o x y s & s u b m i t = C h e c k "   " w w w . p r o x y - c h e c k e r . o r g / r e s u l t . p h p "   |   g r e p   - P o   " ( ? < = c o d e = ' ) [ ^ ' ] * " ) 
 
 g e t l i v e = $ ( c u r l   - s   " h t t p : / / w w w . p r o x y - c h e c k e r . o r g / c h e c k p r o x y . p h p ? p r o x y = $ p r o x y s & c o d e = $ g e t c o d e "   |   g r e p   - P o   " ( ? < = < / t d > < t d > ) [ ^ < ] * "   |   s e d   - n   3 p ) 
 
 g e t c o u n t r y = $ ( c u r l   - s   " h t t p : / / w w w . p r o x y - c h e c k e r . o r g / c h e c k p r o x y . p h p ? p r o x y = $ p r o x y s & c o d e = $ g e t c o d e "   |   g r e p   - P o   " ( ? < = < / t d > < t d > ) [ ^ < ] * "   |   s e d   - n   5 p ) 
 
         i f   [ [   $ g e t l i v e   = =   " w o r k i n g "   ] ] 
 
                 t h e n   
 
                         p r i n t f   " $ p r o x y s   :   L i v e   [ $ g e t c o u n t r y ] \ n " 
 
                         p r i n t f   " $ p r o x y s \ n "   > >   p r o x y l i s t . t x t 
 
                 e l s e   
 
                         p r i n t f   " $ p r o x y s   :   D i e \ n " 
 
         f i 
 
 } 
 
 s l e p t i m e = 0 . 2 
 
 c o u n = 1 
 
 t h r e a d = 1 
 
 f o r   p r o x y s   i n   $ ( c a t   t m p p r o x y . l i s t ) 
 
 d o 
 
 f o r m u l a = $ ( e x p r   $ c o u n   %   $ t h r e a d ) 
 
 	 i f   [ [   $ f o r m u l a   = =   0   & &   $ c o u n   >   0   ] ] ;   t h e n 
 
 	 	 s l e e p   $ s l e p t i m e 
 
 	 f i 
 
 g e t p r o x y l i v e   & 
 
 c o u n = $ [ $ c o u n + 1 ] 
 
 d o n e 
 
 w a i t 
 
