Module: scepter-file-front-end
Author: Jason Trenouth
Copyright: Copyright 1996 Functional Objects, Inc.  All rights reserved

define constant $eoi-token = 0;
define constant $SEMICOLON-token = 1;
define constant $SYNTAX-ERROR-token = 2;
define constant $MODULE-WORD-token = 3;
define constant $IDENTIFIER-token = 4;
define constant $LEFT-BRACE-token = 5;
define constant $RIGHT-BRACE-token = 6;
define constant $INTERFACE-WORD-token = 7;
define constant $COLON-token = 8;
define constant $COMMA-token = 9;
define constant $DOUBLE-COLON-token = 10;
define constant $CONST-token = 11;
define constant $EQUALS-token = 12;
define constant $VERTICAL-BAR-token = 13;
define constant $CIRCUMFLEX-token = 14;
define constant $AMPERSAND-token = 15;
define constant $DOUBLE-LEFT-ANGLE-token = 16;
define constant $DOUBLE-RIGHT-ANGLE-token = 17;
define constant $PLUS-token = 18;
define constant $MINUS-token = 19;
define constant $ASTERISK-token = 20;
define constant $SLASH-token = 21;
define constant $PERCENT-token = 22;
define constant $TILDE-token = 23;
define constant $LEFT-PAREN-token = 24;
define constant $RIGHT-PAREN-token = 25;
define constant $INTEGER-LITERAL-token = 26;
define constant $STRING-LITERAL-token = 27;
define constant $CHARACTER-LITERAL-token = 28;
define constant $FLOATING-PT-LITERAL-token = 29;
define constant $TRUE-token = 30;
define constant $FALSE-token = 31;
define constant $TYPEDEF-token = 32;
define constant $LONG-token = 33;
define constant $SHORT-token = 34;
define constant $UNSIGNED-token = 35;
define constant $DOUBLE-token = 36;
define constant $FLOAT-token = 37;
define constant $CHAR-token = 38;
define constant $WCHAR-token = 39;
define constant $OCTET-token = 40;
define constant $BOOLEAN-token = 41;
define constant $ANY-token = 42;
define constant $STRUCT-token = 43;
define constant $UNION-token = 44;
define constant $SWITCH-token = 45;
define constant $default-token = 46;
define constant $CASE-token = 47;
define constant $ENUM-token = 48;
define constant $RIGHT-ANGLE-token = 49;
define constant $sequence-token = 50;
define constant $LEFT-ANGLE-token = 51;
define constant $STRING-token = 52;
define constant $WSTRING-token = 53;
define constant $LEFT-BRACKET-token = 54;
define constant $RIGHT-BRACKET-token = 55;
define constant $ATTRIBUTE-token = 56;
define constant $READONLY-token = 57;
define constant $EXCEPTION-token = 58;
define constant $ONEWAY-token = 59;
define constant $IDEMPOTENT-token = 60;
define constant $VOID-token = 61;
define constant $IN-token = 62;
define constant $OUT-token = 63;
define constant $INOUT-token = 64;
define constant $RAISES-token = 65;
define constant $CONTEXT-token = 66;

define function idl-parser-action0 (arg$1, arg$2) => (value)
  #f
end idl-parser-action0;

define function idl-parser-action1 () => (value)
  #f
end idl-parser-action1;

define function idl-parser-action9 (arg$1) => (value)
  begin
	 update-parser-state($idl-parser-no-state);
       end
end idl-parser-action9;

define function idl-parser-action10 (arg$1) => (value)
  begin
	 update-parser-state($idl-parser-type-declaration-seen);
       end
end idl-parser-action10;

define function idl-parser-action11 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-constant-declaration-seen);
       end
end idl-parser-action11;

define function idl-parser-action12 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-exception-declaration-seen);
       end
end idl-parser-action12;

define function idl-parser-action13 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-interface-declaration-seen);
       end
end idl-parser-action13;

define function idl-parser-action14 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-module-declaration-seen);
       end
end idl-parser-action14;

define function idl-parser-action15 (arg$1) => (value)
  signal(make(<idl-syntax-error>, parser-state: *parser-state*))
end idl-parser-action15;

define function idl-parser-action16 (arg$1, arg$2, arg$3, arg$4, arg$5) => (value)
  #f
end idl-parser-action16;

define function idl-parser-action17 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-module-seen);
       end
end idl-parser-action17;

define function idl-parser-action18 (arg$1) => (value)
  begin
	 update-parser-state($idl-parser-module-id-seen);
	 parser-action-module-identifier(arg$1);
       end
end idl-parser-action18;

define function idl-parser-action19 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-module-sq-seen);
       end
end idl-parser-action19;

define function idl-parser-action20 (arg$1) => (value)
  begin
       update-parser-state($idl-parser-module-body-seen);
     end
end idl-parser-action20;

define function idl-parser-action21 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-module-qs-seen);
	 parser-action-module-qs-seen();
       end
end idl-parser-action21;

define function idl-parser-action22 (arg$1) => (value)
  #f
end idl-parser-action22;

define function idl-parser-action24 (arg$1, arg$2, arg$3, arg$4) => (value)
  #f
end idl-parser-action24;

define function idl-parser-action25 (arg$1) => (value)
  parser-action-interface-header-seen(arg$1)
end idl-parser-action25;

define function idl-parser-action26 (arg$1, arg$2) => (value)
  begin
         update-parser-state($idl-parser-inheritance-spec-seen);
         parser-action-interface-header(arg$1, arg$2);
       end
end idl-parser-action26;

define function idl-parser-action27 (arg$1, arg$2) => (value)
  arg$2
end idl-parser-action27;

define function idl-parser-action28 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-interface-seen);
       end
end idl-parser-action28;

define function idl-parser-action29 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-interface-id-seen);
         arg$1;
       end
end idl-parser-action29;

define function idl-parser-action32 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-inheritance-spec-colon-seen);
       end
end idl-parser-action32;

define function idl-parser-action33 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-interface-sq-seen);
       end
end idl-parser-action33;

define function idl-parser-action34 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-interface-body-seen);
       end
end idl-parser-action34;

define function idl-parser-action35 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-interface-qs-seen);
	 let scepter = get-scepter();
         pop(scepter.scepter-scopes);
       end
end idl-parser-action35;

define function idl-parser-action38 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-attribute-declaration-seen);
       end
end idl-parser-action38;

define function idl-parser-action39 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-operation-declaration-seen);
       end
end idl-parser-action39;

define function idl-parser-action46 (arg$1, arg$2) => (value)
  begin
         push(arg$2, arg$1);
	 arg$2;
       end
end idl-parser-action46;

define function idl-parser-action47 (arg$1, arg$2) => (value)
  begin
         update-parser-state($idl-parser-scoped-names-comma-seen);
	 arg$1;
       end
end idl-parser-action47;

define function idl-parser-action48 () => (value)
  make(<deque>)
end idl-parser-action48;

define function idl-parser-action49 (arg$1, arg$2) => (value)
  begin
	 parser-action-scoped-names(arg$1, arg$2);
       end
end idl-parser-action49;

define function idl-parser-action50 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-scope-delimiter-seen);
         arg$1;
       end
end idl-parser-action50;

define function idl-parser-action51 (arg$1) => (value)
  begin
	 parser-action-scoped-name$1(arg$1);
       end
end idl-parser-action51;

define function idl-parser-action52 (arg$1, arg$2) => (value)
  begin
	 parser-action-scoped-name$2(arg$1, arg$2);
       end
end idl-parser-action52;

define function idl-parser-action53 (arg$1, arg$2, arg$3) => (value)
  begin
	 parser-action-scoped-name$3(arg$1, arg$2, arg$3);
       end
end idl-parser-action53;

define function idl-parser-action54 (arg$1) => (value)
  parser-action-id(arg$1)
end idl-parser-action54;

define function idl-parser-action55 (arg$1) => (value)
  begin
	 parser-action-forward(arg$1);
       end
end idl-parser-action55;

define function idl-parser-action56 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-constant-seen);
       end
end idl-parser-action56;

define function idl-parser-action57 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-constant-type-seen);
         arg$1;
       end
end idl-parser-action57;

define function idl-parser-action58 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-constant-id-seen);
         arg$1;
       end
end idl-parser-action58;

define function idl-parser-action59 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-constant-assignment-seen);
       end
end idl-parser-action59;

define function idl-parser-action60 (arg$1, arg$2, arg$3, arg$4, arg$5) => (value)
  begin
	 parser-action-const-dcl(arg$2, arg$3, arg$5);
       end
end idl-parser-action60;

define function idl-parser-action61 (arg$1) => (value)
  resolve-primitive-type(last(scepter-scopes(get-scepter())), arg$1)
end idl-parser-action61;

define function idl-parser-action66 (arg$1) => (value)
  arg$1
end idl-parser-action66;

define function idl-parser-action67 (arg$1) => (value)
  resolve-primitive-type(last(scepter-scopes(get-scepter())), $wstring-idl-type)
end idl-parser-action67;

define function idl-parser-action68 (arg$1) => (value)
  resolve-scoped-name(first(scepter-scopes(get-scepter())), arg$1, reference?: #t)
end idl-parser-action68;

define function idl-parser-action72 (arg$1, arg$2, arg$3) => (value)
  make(<ast-expression>,
            combinator: $or-combinator,
            left-subexpression: arg$1,
            right-subexpression: arg$3)
end idl-parser-action72;

define function idl-parser-action74 (arg$1, arg$2, arg$3) => (value)
  make(<ast-expression>,
            combinator: $xor-combinator,
            left-subexpression: arg$1,
            right-subexpression: arg$3)
end idl-parser-action74;

define function idl-parser-action76 (arg$1, arg$2, arg$3) => (value)
  make(<ast-expression>,
            combinator: $and-combinator,
            left-subexpression: arg$1,
            right-subexpression: arg$3)
end idl-parser-action76;

define function idl-parser-action78 (arg$1, arg$2, arg$3) => (value)
  make(<ast-expression>,
            combinator: $left-shift-combinator,
            left-subexpression: arg$1,
            right-subexpression: arg$3)
end idl-parser-action78;

define function idl-parser-action79 (arg$1, arg$2, arg$3) => (value)
  make(<ast-expression>,
            combinator: $right-shift-combinator,
            left-subexpression: arg$1,
            right-subexpression: arg$3)
end idl-parser-action79;

define function idl-parser-action81 (arg$1, arg$2, arg$3) => (value)
  make(<ast-expression>,
            combinator: $add-combinator,
            left-subexpression: arg$1,
            right-subexpression: arg$3)
end idl-parser-action81;

define function idl-parser-action82 (arg$1, arg$2, arg$3) => (value)
  make(<ast-expression>,
            combinator: $minus-combinator,
            left-subexpression: arg$1,
            right-subexpression: arg$3)
end idl-parser-action82;

define function idl-parser-action84 (arg$1, arg$2, arg$3) => (value)
  make(<ast-expression>,
            combinator: $multiply-combinator,
            left-subexpression: arg$1,
            right-subexpression: arg$3)
end idl-parser-action84;

define function idl-parser-action85 (arg$1, arg$2, arg$3) => (value)
  make(<ast-expression>,
            combinator: $divide-combinator,
            left-subexpression: arg$1,
            right-subexpression: arg$3)
end idl-parser-action85;

define function idl-parser-action86 (arg$1, arg$2, arg$3) => (value)
  make(<ast-expression>,
            combinator: $modulus-combinator,
            left-subexpression: arg$1,
            right-subexpression: arg$3)
end idl-parser-action86;

define function idl-parser-action88 (arg$1, arg$2) => (value)
  make(<ast-expression>,
            combinator: $unary-plus-combinator,
            right-subexpression: arg$2)
end idl-parser-action88;

define function idl-parser-action89 (arg$1, arg$2) => (value)
  make(<ast-expression>,
            combinator: $unary-minus-combinator,
            right-subexpression: arg$2)
end idl-parser-action89;

define function idl-parser-action90 (arg$1, arg$2) => (value)
  make(<ast-expression>,
            combinator: $bitwise-negation-combinator,
            right-subexpression: arg$2)
end idl-parser-action90;

define function idl-parser-action91 (arg$1) => (value)
  make(<ast-expression>,
            combinator: $symbol-combinator,
            scoped-name: arg$1)
end idl-parser-action91;

define function idl-parser-action93 (arg$1, arg$2, arg$3) => (value)
  arg$2
end idl-parser-action93;

define function idl-parser-action94 (arg$1) => (value)
  make(<ast-expression>,
            combinator: $no-combinator,
            value: arg$1)
end idl-parser-action94;

define function idl-parser-action96 (arg$1) => (value)
  make(<ast-expression>,
            combinator: $no-combinator,
            value: as(<character>, arg$1))
end idl-parser-action96;

define function idl-parser-action98 (arg$1) => (value)
  make(<ast-expression>,
            combinator: $no-combinator,
            value: #t)
end idl-parser-action98;

define function idl-parser-action99 (arg$1) => (value)
  make(<ast-expression>,
            combinator: $no-combinator,
            value: #f)
end idl-parser-action99;

define function idl-parser-action100 (arg$1) => (value)
  begin
	 parser-action-positive-int-expr(arg$1);
       end
end idl-parser-action100;

define function idl-parser-action101 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-typedef-seen);
       end
end idl-parser-action101;

define function idl-parser-action106 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-type-spec-seen);
         arg$1;
       end
end idl-parser-action106;

define function idl-parser-action107 (arg$1, arg$2) => (value)
  begin
	 parser-action-type-declarator(arg$1, arg$2);
       end
end idl-parser-action107;

define function idl-parser-action112 (arg$1) => (value)
  resolve-scoped-name(first(scepter-scopes(get-scepter())), arg$1, reference?: #t, error?: #t)
end idl-parser-action112;

define function idl-parser-action126 (arg$1, arg$2) => (value)
  begin
         update-parser-state($idl-parser-declarators-comma-seen);
	 arg$1;
       end
end idl-parser-action126;

define function idl-parser-action128 (arg$1, arg$2) => (value)
  begin
         update-parser-state($idl-parser-declarators-declarator-seen);
         push-last(arg$1, arg$2);
	 arg$1;
       end
end idl-parser-action128;

define function idl-parser-action131 (arg$1) => (value)
  make(<fe-simple-declarator>, local-name: arg$1)
end idl-parser-action131;

define function idl-parser-action132 (arg$1) => (value)
  make(<fe-complex-declarator>, local-name: arg$1.declarator-local-name, complex-part: arg$1)
end idl-parser-action132;

define function idl-parser-action135 (arg$1) => (value)
  $long-idl-type
end idl-parser-action135;

define function idl-parser-action136 (arg$1, arg$2) => (value)
  $longlong-idl-type
end idl-parser-action136;

define function idl-parser-action137 (arg$1) => (value)
  $short-idl-type
end idl-parser-action137;

define function idl-parser-action138 (arg$1, arg$2) => (value)
  $ulong-idl-type
end idl-parser-action138;

define function idl-parser-action139 (arg$1, arg$2, arg$3) => (value)
  $ulonglong-idl-type
end idl-parser-action139;

define function idl-parser-action140 (arg$1, arg$2) => (value)
  $ushort-idl-type
end idl-parser-action140;

define function idl-parser-action141 (arg$1) => (value)
  $double-idl-type
end idl-parser-action141;

define function idl-parser-action142 (arg$1) => (value)
  $float-idl-type
end idl-parser-action142;

define function idl-parser-action143 (arg$1, arg$2) => (value)
  $longdouble-idl-type
end idl-parser-action143;

define function idl-parser-action144 (arg$1) => (value)
  $char-idl-type
end idl-parser-action144;

define function idl-parser-action145 (arg$1) => (value)
  $wchar-idl-type
end idl-parser-action145;

define function idl-parser-action146 (arg$1) => (value)
  $octet-idl-type
end idl-parser-action146;

define function idl-parser-action147 (arg$1) => (value)
  $boolean-idl-type
end idl-parser-action147;

define function idl-parser-action148 (arg$1) => (value)
  $any-idl-type
end idl-parser-action148;

define function idl-parser-action149 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-struct-seen);
       end
end idl-parser-action149;

define function idl-parser-action150 (arg$1) => (value)
  begin
	 parser-action-struct-type-id-seen(arg$1);
       end
end idl-parser-action150;

define function idl-parser-action151 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-struct-sq-seen);
       end
end idl-parser-action151;

define function idl-parser-action152 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-struct-body-seen);
         arg$1;
       end
end idl-parser-action152;

define function idl-parser-action153 (arg$1, arg$2, arg$3, arg$4, arg$5) => (value)
  begin
         update-parser-state($idl-parser-struct-qs-seen);
         pop(scepter-scopes(get-scepter()));
       end
end idl-parser-action153;

define function idl-parser-action157 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-member-type-seen);
         arg$1;
       end
end idl-parser-action157;

define function idl-parser-action158 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-member-declarators-seen);
         arg$1;
       end
end idl-parser-action158;

define function idl-parser-action159 (arg$1, arg$2, arg$3) => (value)
  begin
	 parser-action-member(arg$1, arg$2);
       end
end idl-parser-action159;

define function idl-parser-action161 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-union-seen);
       end
end idl-parser-action161;

define function idl-parser-action162 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-union-id-seen);
         arg$1;
       end
end idl-parser-action162;

define function idl-parser-action163 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-switch-seen);
       end
end idl-parser-action163;

define function idl-parser-action164 (arg$1) => (value)
  *parser-state* :=$idl-parser-switch-open-paren-seen
end idl-parser-action164;

define function idl-parser-action165 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-switch-type-seen);
         arg$1;
       end
end idl-parser-action165;

define function idl-parser-action166 (arg$1, arg$2, arg$3, arg$4, arg$5, arg$6) => (value)
  begin
	 parser-action-union-type-start(arg$2, arg$5);
       end
end idl-parser-action166;

define function idl-parser-action167 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-union-sq-seen);
       end
end idl-parser-action167;

define function idl-parser-action168 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-union-body-seen);
         arg$1;
       end
end idl-parser-action168;

define function idl-parser-action169 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-union-qs-seen);
         pop(scepter-scopes(get-scepter()));
       end
end idl-parser-action169;

define function idl-parser-action170 (arg$1, arg$2, arg$3, arg$4) => (value)
  arg$4
end idl-parser-action170;

define function idl-parser-action180 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-union-label-seen);
         arg$1;
       end
end idl-parser-action180;

define function idl-parser-action181 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-union-element-seen);
         arg$1;
       end
end idl-parser-action181;

define function idl-parser-action182 (arg$1, arg$2, arg$3) => (value)
  begin
	 parser-action-case-branch(arg$1, arg$2);
       end
end idl-parser-action182;

define function idl-parser-action186 (arg$1, arg$2) => (value)
  begin
         push-last(arg$1, arg$2);
	 arg$1;
       end
end idl-parser-action186;

define function idl-parser-action187 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-default-seen);
       end
end idl-parser-action187;

define function idl-parser-action188 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-case-seen);
       end
end idl-parser-action188;

define function idl-parser-action189 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-label-expression-seen);
         arg$1;
       end
end idl-parser-action189;

define function idl-parser-action190 (arg$1, arg$2) => (value)
  begin
         update-parser-state($idl-parser-label-colon-seen);
         make(<ast-default-union-branch-label>);
       end
end idl-parser-action190;

define function idl-parser-action191 (arg$1, arg$2, arg$3) => (value)
  begin
         update-parser-state($idl-parser-label-colon-seen);
         make(<ast-union-branch-label>, value: arg$2);
       end
end idl-parser-action191;

define function idl-parser-action192 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-union-element-type-seen);
         arg$1;
       end
end idl-parser-action192;

define function idl-parser-action193 (arg$1, arg$2) => (value)
  begin
	 parser-action-element-spec(arg$1, arg$2);
       end
end idl-parser-action193;

define function idl-parser-action194 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-enum-seen)
       end
end idl-parser-action194;

define function idl-parser-action195 (arg$1) => (value)
  begin
	 parser-action-enum-type-id-seen(arg$1);
       end
end idl-parser-action195;

define function idl-parser-action196 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-enum-sq-seen)
       end
end idl-parser-action196;

define function idl-parser-action197 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-enum-body-seen);
         arg$1;
       end
end idl-parser-action197;

define function idl-parser-action198 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-enum-qs-seen);
         pop(scepter-scopes(get-scepter()));
       end
end idl-parser-action198;

define function idl-parser-action199 (arg$1, arg$2, arg$3, arg$4, arg$5) => (value)
  arg$5
end idl-parser-action199;

define function idl-parser-action201 (arg$1, arg$2) => (value)
  begin
         update-parser-state($idl-parser-enum-comma-seen);
       end
end idl-parser-action201;

define function idl-parser-action204 (arg$1) => (value)
  begin
	 parser-action-enumerator(arg$1);
       end
end idl-parser-action204;

define function idl-parser-action205 (arg$1, arg$2, arg$3) => (value)
  begin
	 parser-action-sequence-type-spec$1(arg$1, arg$2);
       end
end idl-parser-action205;

define function idl-parser-action206 (arg$1, arg$2) => (value)
  begin
	 parser-action-sequence-type-spec$2(arg$1);
       end
end idl-parser-action206;

define function idl-parser-action207 (arg$1, arg$2) => (value)
  begin
         update-parser-state($idl-parser-sequence-comma-seen);
         arg$1;
       end
end idl-parser-action207;

define function idl-parser-action208 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-sequence-expression-seen);
         arg$1;
       end
end idl-parser-action208;

define function idl-parser-action209 (arg$1, arg$2, arg$3) => (value)
  begin
         update-parser-state($idl-parser-sequence-type-seen);
         arg$3;
       end
end idl-parser-action209;

define function idl-parser-action210 (arg$1) => (value)
  begin
	 parser-action-seq-head-sequence-seen();
       end
end idl-parser-action210;

define function idl-parser-action211 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-sequence-sq-seen);
       end
end idl-parser-action211;

define function idl-parser-action212 (arg$1, arg$2) => (value)
  begin
         update-parser-state($idl-parser-string-sq-seen);
         arg$1;
       end
end idl-parser-action212;

define function idl-parser-action213 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-string-expression-seen);
         arg$1;
       end
end idl-parser-action213;

define function idl-parser-action214 (arg$1, arg$2, arg$3) => (value)
  begin
	 parser-action-string-type-spec$1(arg$2);
       end
end idl-parser-action214;

define function idl-parser-action215 (arg$1) => (value)
  begin
	 parser-action-string-type-spec$2();
       end
end idl-parser-action215;

define function idl-parser-action216 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-string-seen);
         arg$1;
       end
end idl-parser-action216;

define function idl-parser-action219 (arg$1, arg$2, arg$3) => (value)
  begin
	 parser-action-wstring-type-spec$1(arg$2);
       end
end idl-parser-action219;

define function idl-parser-action220 (arg$1) => (value)
  begin
	 parser-action-wstring-type-spec$2();
       end
end idl-parser-action220;

define function idl-parser-action222 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-array-id-seen);
         arg$1;
       end
end idl-parser-action222;

define function idl-parser-action223 (arg$1, arg$2) => (value)
  begin
         update-parser-state($idl-parser-array-completed);
         make(<ast-array>, local-name: arg$1, dimensions: arg$2);
       end
end idl-parser-action223;

define function idl-parser-action227 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-dimension-sq-seen);
       end
end idl-parser-action227;

define function idl-parser-action228 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-dimension-expression-seen);
         arg$1;
       end
end idl-parser-action228;

define function idl-parser-action229 (arg$1, arg$2, arg$3) => (value)
  begin
         update-parser-state($idl-parser-dimension-qs-seen);
         coerce(arg$2, $ulong-idl-type);
         arg$2;
       end
end idl-parser-action229;

define function idl-parser-action230 (arg$1, arg$2, arg$3) => (value)
  begin
	 parser-action-attribute-dcl(arg$1, arg$2, arg$3);
       end
end idl-parser-action230;

define function idl-parser-action231 (arg$1, arg$2) => (value)
  begin
         update-parser-state($idl-parser-attribute-seen);
         arg$1;
       end
end idl-parser-action231;

define function idl-parser-action233 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-attribute-ro-seen);
	 #t;
       end
end idl-parser-action233;

define function idl-parser-action234 (arg$1, arg$2, arg$3, arg$4, arg$5) => (value)
  begin
         update-parser-state($idl-parser-exception-qs-seen);
         pop(scepter-scopes(get-scepter()));
       end
end idl-parser-action234;

define function idl-parser-action235 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-attribute-type-seen);
         arg$1;
       end
end idl-parser-action235;

define function idl-parser-action236 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-exception-seen);
       end
end idl-parser-action236;

define function idl-parser-action237 (arg$1) => (value)
  begin
	 parser-action-exception-id-seen(arg$1);
       end
end idl-parser-action237;

define function idl-parser-action238 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-exception-sq-seen);
       end
end idl-parser-action238;

define function idl-parser-action239 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-exception-body-seen);
         arg$1;
       end
end idl-parser-action239;

define function idl-parser-action240 (arg$1, arg$2, arg$3, arg$4) => (value)
  begin
	 parser-action-operation(arg$3, arg$4);
       end
end idl-parser-action240;

define function idl-parser-action241 (arg$1, arg$2, arg$3) => (value)
  begin
	 parser-action-operation-id-seen(arg$1, arg$2, arg$3);
       end
end idl-parser-action241;

define function idl-parser-action242 () => (value)
  $no-operation-flag
end idl-parser-action242;

define function idl-parser-action243 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-operation-attribute-seen);
         $oneway-operation-flag;
       end
end idl-parser-action243;

define function idl-parser-action244 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-operation-attribute-seen);
         $idempotent-operation-flag;
       end
end idl-parser-action244;

define function idl-parser-action245 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-operation-type-seen);
         arg$1;
       end
end idl-parser-action245;

define function idl-parser-action247 (arg$1) => (value)
  resolve-primitive-type(last(scepter-scopes(get-scepter())), $void-idl-type)
end idl-parser-action247;

define function idl-parser-action248 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-operation-parameters-completed);
         arg$1;
       end
end idl-parser-action248;

define function idl-parser-action249 (arg$1) => (value)
  begin
	 parser-action-operation-raises-completed(arg$1);
       end
end idl-parser-action249;

define function idl-parser-action252 (arg$1) => (value)
  update-parser-state($idl-parser-operation-sq-seen)
end idl-parser-action252;

define function idl-parser-action253 (arg$1) => (value)
  update-parser-state($idl-parser-operation-qs-seen)
end idl-parser-action253;

define function idl-parser-action257 (arg$1, arg$2) => (value)
  begin
         update-parser-state($idl-parser-operation-parameters-comma-seen);
       end
end idl-parser-action257;

define function idl-parser-action258 (arg$1, arg$2, arg$3) => (value)
  begin
	 parser-action-parameter(arg$1, arg$2, arg$3);
       end
end idl-parser-action258;

define function idl-parser-action259 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-operation-parameter-direction-seen);
         arg$1;
       end
end idl-parser-action259;

define function idl-parser-action260 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-operation-parameter-type-seen);
         arg$1;
       end
end idl-parser-action260;

define function idl-parser-action261 (arg$1) => (value)
  $in-argument-direction
end idl-parser-action261;

define function idl-parser-action262 (arg$1) => (value)
  $out-argument-direction
end idl-parser-action262;

define function idl-parser-action263 (arg$1) => (value)
  $inout-argument-direction
end idl-parser-action263;

define function idl-parser-action265 (arg$1, arg$2, arg$3, arg$4) => (value)
  begin
         update-parser-state($idl-parser-operation-raises-qs-seen);
         arg$3;
       end
end idl-parser-action265;

define function idl-parser-action266 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-operation-raises-seen);
       end
end idl-parser-action266;

define function idl-parser-action267 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-operation-raises-sq-seen);
       end
end idl-parser-action267;

define function idl-parser-action268 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-operation-context-seen);
       end
end idl-parser-action268;

define function idl-parser-action269 (arg$1) => (value)
  begin
         update-parser-state($idl-parser-operation-context-sq-seen);
       end
end idl-parser-action269;

define function idl-parser-action270 () => (value)
  make(<context-collection>)
end idl-parser-action270;

define function idl-parser-action271 (arg$1, arg$2, arg$3, arg$4) => (value)
  begin
	 parser-action-opt-context(arg$3);
       end
end idl-parser-action271;

define function idl-parser-action272 (arg$1, arg$2) => (value)
  begin
         update-parser-state($idl-parser-operation-context-comma-seen);
         arg$1;
       end
end idl-parser-action272;

define constant idl-parser :: <parser>
  = make(<parser>,
  action-table:
      #[#[65535, 1, 0, 1, 2, 1, 3, 1, 7, 1, 11, 1, 32, 1, 43, 1, 44, 1, 48, 1, 58, 1],
	#[7, -25, 0, -4, 2, -9, 3, -31, 11, -24, 32, -33, 43, -35, 44, -30, 48, -21, 58, -16],
	#[1, -220],
	#[#"eoi", #"accept"],
	#[65535, 13, 1, 13],
	#[1, -220],
	#[65535, 103, 1, 103],
	#[1, -220],
	#[65535, 15, 1, 15],
	#[65535, 23, 1, 23],
	#[4, -51],
	#[65535, 2, 0, 2, 2, 2, 3, 2, 6, 2, 7, 2, 11, 2, 32, 2, 43, 2, 44, 2, 58, 2, 48, 2],
	#[65535, 25, 5, 25],
	#[1, -220],
	#[4, -51],
	#[65535, 236, 4, 236],
	#[65535, 22, 1, 22],
	#[65535, 11, 1, 11],
	#[1, -220],
	#[65535, 14, 1, 14],
	#[65535, 194, 4, 194],
	#[1, -220],
	#[4, -51],
	#[65535, 56, 36, 56, 4, 56, 10, 56, 33, 56, 34, 56, 35, 56, 37, 56, 38, 56, 39, 56, 40, 56, 41, 56, 52, 56, 53, 56],
	#[65535, 28, 4, 28],
	#[4, -51, 10, -80, 33, -96, 34, -55, 35, -77, 36, -87, 37, -92, 38, -72, 39, -78, 40, -90, 41, -59, 42, -65, 43, -35, 44, -30, 48, -21, 50, -66, 52, -56, 53, -67],
	#[65535, 104, 1, 104],
	#[65535, 10, 1, 10],
	#[65535, 105, 1, 105],
	#[65535, 161, 4, 161],
	#[65535, 17, 4, 17],
	#[4, -51],
	#[65535, 101, 10, 101, 38, 101, 4, 101, 39, 101, 37, 101, 35, 101, 34, 101, 40, 101, 41, 101, 42, 101, 33, 101, 36, 101, 43, 101, 44, 101, 48, 101, 50, 101, 52, 101, 53, 101],
	#[1, 55, 5, 30, 8, -370],
	#[65535, 149, 4, 149],
	#[35, -77, 4, -51, 10, -80, 34, -55, 33, -96, 36, -87, 37, -92, 38, -72, 39, -78, 40, -90, 41, -59, 52, -56, 53, -67],
	#[5, -261],
	#[5, -230],
	#[65535, 12, 1, 12],
	#[4, -51],
	#[4, -43],
	#[5, -44],
	#[65535, 18, 5, 18],
	#[65535, 19, 2, 19, 3, 19, 6, 19, 7, 19, 11, 19, 44, 19, 32, 19, 43, 19, 58, 19, 48, 19],
	#[65535, 1, 2, 1, 3, 1, 6, 1, 7, 1, 11, 1, 44, 1, 32, 1, 43, 1, 48, 1, 58, 1],
	#[2, -9, 3, -31, 6, 20, 7, -25, 11, -24, 32, -33, 43, -35, 44, -30, 48, -21, 58, -16],
	#[6, -49],
	#[65535, 16, 1, 16],
	#[65535, 21, 1, 21],
	#[5, -53],
	#[65535, 54, 13, 54, 15, 54, 1, 54, 20, 54, 4, 54, 5, 54, 8, 54, 9, 54, 10, 54, 12, 54, 14, 54, 16, 54, 17, 54, 18, 54, 19, 54, 21, 54, 22, 54, 25, 54, 45, 54, 49, 54, 54, 54, 55, 54],
	#[65535, 150, 5, 150],
	#[65535, 151, 2, 151, 4, 151, 10, 151, 36, 151, 44, 151, 33, 151, 34, 151, 35, 151, 37, 151, 38, 151, 39, 151, 40, 151, 41, 151, 42, 151, 43, 151, 48, 151, 50, 151, 52, 151, 53, 151],
	#[2, -9, 4, -51, 10, -80, 35, -77, 44, -30, 33, -96, 34, -55, 52, -56, 36, -87, 37, -92, 38, -72, 39, -78, 40, -90, 41, -59, 42, -65, 43, -35, 48, -21, 50, -66, 53, -67],
	#[65535, 137, 4, 137, 9, 137, 25, 137, 49, 137],
	#[65535, 216, 4, 216, 9, 216, 49, 216, 51, 216],
	#[65535, 116, 4, 116, 9, 116, 49, 116],
	#[4, 220, 9, 220, 49, 220, 51, -225],
	#[65535, 147, 4, 147, 9, 147, 25, 147, 49, 147],
	#[65535, 108, 4, 108],
	#[4, -51, 10, -80, 18, -125, 19, -121, 23, -108, 24, -103, 26, -112, 27, -116, 28, -104, 29, -115, 30, -113, 31, -111],
	#[65535, 134, 4, 134, 9, 134, 25, 134, 49, 134],
	#[4, 215, 9, 215, 49, 215, 51, -224],
	#[65535, 123, 4, 123],
	#[65535, 148, 4, 148, 9, 148, 49, 148],
	#[65535, 210, 51, 210],
	#[65535, 221, 4, 221, 9, 221, 49, 221, 51, 221],
	#[4, -51],
	#[65535, 117, 4, 117, 9, 117, 49, 117],
	#[65535, 121, 4, 121, 9, 121, 49, 121],
	#[65535, 157, 4, 157],
	#[65535, 144, 9, 144, 4, 144, 25, 144, 49, 144],
	#[65535, 119, 4, 119, 9, 119, 49, 119],
	#[65535, 133, 4, 133, 9, 133, 25, 133, 49, 133],
	#[1, -220],
	#[65535, 120, 4, 120, 9, 120, 49, 120],
	#[33, -180, 34, -181],
	#[65535, 145, 4, 145, 9, 145, 25, 145, 49, 145],
	#[65535, 122, 4, 122],
	#[65535, 50, 4, 50],
	#[65535, 109, 4, 109],
	#[65535, 111, 4, 111, 9, 111, 49, 111],
	#[9, -162, 49, -163],
	#[65535, 115, 9, 115, 4, 115, 49, 115],
	#[65535, 51, 1, 51, 4, 51, 5, 51, 18, 51, 8, 51, 9, 51, 10, 51, 13, 51, 14, 51, 15, 51, 16, 51, 17, 51, 25, 51, 19, 51, 20, 51, 21, 51, 22, 51, 49, 51, 55, 51],
	#[4, 112, 9, 112, 10, -80, 49, 112],
	#[65535, 141, 9, 141, 4, 141, 49, 141],
	#[65535, 124, 4, 124],
	#[51, -221],
	#[65535, 146, 4, 146, 9, 146, 25, 146, 49, 146],
	#[6, -259],
	#[65535, 142, 4, 142, 9, 142, 49, 142],
	#[65535, 113, 4, 113, 9, 113, 49, 113],
	#[65535, 155, 2, 155, 4, 155, 6, 155, 10, 155, 34, 155, 41, 155, 43, 155, 33, 155, 53, 155, 35, 155, 36, 155, 37, 155, 38, 155, 39, 155, 40, 155, 42, 155, 48, 155, 44, 155, 50, 155, 52, 155],
	#[65535, 118, 4, 118, 9, 118, 49, 118],
	#[4, 135, 9, 135, 33, -158, 36, -159, 49, 135],
	#[65535, 110, 4, 110, 9, 110, 49, 110],
	#[65535, 152, 6, 152],
	#[65535, 114, 4, 114, 9, 114, 49, 114],
	#[4, -51, 10, -80, 18, -125, 19, -121, 23, -108, 24, -103, 26, -112, 27, -116, 28, -104, 29, -115, 30, -113, 31, -111],
	#[4, -51],
	#[4, -51, 10, -80, 18, -125, 19, -121, 23, -108, 24, -103, 26, -112, 27, -116, 28, -104, 29, -115, 30, -113, 31, -111],
	#[4, -51, 10, -80, 18, -125, 19, -121, 23, -108, 24, -103, 26, -112, 27, -116, 28, -104, 29, -115, 30, -113, 31, -111],
	#[65535, 96, 1, 96, 18, 96, 8, 96, 17, 96, 13, 96, 14, 96, 15, 96, 16, 96, 25, 96, 19, 96, 20, 96, 21, 96, 22, 96, 49, 96, 55, 96],
	#[1, 77, 8, 77, 13, 77, 14, 77, 15, 77, 16, 77, 17, 77, 18, -146, 19, -145, 25, 77, 49, 77, 55, 77],
	#[65535, 92, 1, 92, 8, 92, 13, 92, 14, 92, 15, 92, 16, 92, 17, 92, 18, 92, 19, 92, 20, 92, 21, 92, 22, 92, 25, 92, 49, 92, 55, 92],
	#[15, -150, 14, 73, 13, 73, 1, 73, 8, 73, 25, 73, 55, 73, 49, 73],
	#[4, -51, 10, -80, 24, -103, 26, -112, 27, -116, 28, -104, 29, -115, 30, -113, 31, -111],
	#[13, -152, 1, 70, 8, 70, 25, 70, 55, 70, 49, 70],
	#[13, 91, 8, 91, 10, -80, 1, 91, 21, 91, 17, 91, 14, 91, 15, 91, 16, 91, 18, 91, 19, 91, 20, 91, 22, 91, 25, 91, 55, 91, 49, 91],
	#[65535, 99, 1, 99, 8, 99, 13, 99, 14, 99, 15, 99, 16, 99, 17, 99, 18, 99, 19, 99, 20, 99, 21, 99, 22, 99, 25, 99, 49, 99, 55, 99],
	#[65535, 94, 1, 94, 8, 94, 13, 94, 14, 94, 15, 94, 16, 94, 17, 94, 18, 94, 19, 94, 20, 94, 21, 94, 22, 94, 25, 94, 55, 94, 49, 94],
	#[65535, 98, 49, 98, 55, 98, 1, 98, 8, 98, 13, 98, 14, 98, 15, 98, 16, 98, 17, 98, 18, 98, 19, 98, 20, 98, 21, 98, 22, 98, 25, 98],
	#[65535, 83, 1, 83, 8, 83, 13, 83, 14, 83, 15, 83, 16, 83, 17, 83, 18, 83, 19, 83, 20, 83, 21, 83, 22, 83, 25, 83, 49, 83, 55, 83],
	#[65535, 97, 1, 97, 20, 97, 8, 97, 13, 97, 14, 97, 15, 97, 16, 97, 17, 97, 18, 97, 19, 97, 21, 97, 22, 97, 25, 97, 49, 97, 55, 97],
	#[65535, 95, 1, 95, 20, 95, 8, 95, 13, 95, 14, 95, 15, 95, 16, 95, 17, 95, 18, 95, 19, 95, 21, 95, 22, 95, 25, 95, 49, 95, 55, 95],
	#[1, 75, 8, 75, 13, 75, 14, 75, 15, 75, 16, -143, 17, -142, 25, 75, 49, 75, 55, 75],
	#[65535, 87, 1, 87, 18, 87, 8, 87, 17, 87, 13, 87, 14, 87, 15, 87, 16, 87, 19, 87, 20, 87, 21, 87, 22, 87, 25, 87, 55, 87, 49, 87],
	#[1, 71, 8, 71, 13, 71, 14, -140, 25, 71, 55, 71, 49, 71],
	#[49, -154],
	#[4, -51, 10, -80, 24, -103, 26, -112, 27, -116, 28, -104, 29, -115, 30, -113, 31, -111],
	#[15, 80, 1, 80, 14, 80, 19, 80, 13, 80, 21, -133, 8, 80, 16, 80, 17, 80, 18, 80, 20, -134, 22, -132, 25, 80, 55, 80, 49, 80],
	#[65535, 100, 49, 100, 55, 100],
	#[65535, 213, 49, 213],
	#[10, -80, 4, -51, 29, -115, 28, -104, 27, -116, 24, -103, 26, -112, 30, -113, 31, -111],
	#[65535, 88, 1, 88, 8, 88, 13, 88, 14, 88, 15, 88, 16, 88, 17, 88, 18, 88, 19, 88, 20, 88, 21, 88, 22, 88, 25, 88, 49, 88, 55, 88],
	#[65535, 52, 1, 52, 4, 52, 5, 52, 8, 52, 9, 52, 10, 52, 13, 52, 14, 52, 15, 52, 16, 52, 17, 52, 18, 52, 19, 52, 20, 52, 21, 52, 22, 52, 25, 52, 55, 52, 49, 52],
	#[4, -51],
	#[65535, 53, 1, 53, 4, 53, 5, 53, 8, 53, 9, 53, 10, 53, 13, 53, 14, 53, 15, 53, 16, 53, 17, 53, 18, 53, 19, 53, 20, 53, 21, 53, 22, 53, 25, 53, 49, 53, 55, 53],
	#[25, -131],
	#[65535, 93, 17, 93, 15, 93, 13, 93, 55, 93, 22, 93, 1, 93, 21, 93, 20, 93, 8, 93, 16, 93, 14, 93, 18, 93, 19, 93, 25, 93, 49, 93],
	#[4, -51, 10, -80, 18, -125, 19, -121, 23, -108, 24, -103, 26, -112, 27, -116, 28, -104, 29, -115, 30, -113, 31, -111],
	#[4, -51, 10, -80, 18, -125, 19, -121, 23, -108, 24, -103, 26, -112, 27, -116, 28, -104, 29, -115, 30, -113, 31, -111],
	#[4, -51, 18, -125, 31, -111, 26, -112, 30, -113, 10, -80, 28, -104, 19, -121, 23, -108, 24, -103, 27, -116, 29, -115],
	#[65535, 84, 1, 84, 8, 84, 13, 84, 14, 84, 15, 84, 16, 84, 17, 84, 18, 84, 19, 84, 20, 84, 21, 84, 22, 84, 25, 84, 49, 84, 55, 84],
	#[65535, 89, 1, 89, 8, 89, 13, 89, 14, 89, 15, 89, 16, 89, 17, 89, 18, 89, 19, 89, 20, 89, 21, 89, 22, 89, 25, 89, 49, 89, 55, 89],
	#[65535, 90, 1, 90, 8, 90, 13, 90, 14, 90, 15, 90, 16, 90, 17, 90, 18, 90, 19, 90, 20, 90, 21, 90, 22, 90, 25, 90, 49, 90, 55, 90],
	#[65535, 85, 1, 85, 8, 85, 13, 85, 14, 85, 15, 85, 16, 85, 17, 85, 18, 85, 19, 85, 20, 85, 21, 85, 22, 85, 25, 85, 49, 85, 55, 85],
	#[65535, 86, 1, 86, 8, 86, 13, 86, 14, 86, 15, 86, 16, 86, 17, 86, 18, 86, 19, 86, 20, 86, 21, 86, 22, 86, 25, 86, 49, 86, 55, 86],
	#[23, -108, 19, -121, 30, -113, 4, -51, 24, -103, 18, -125, 10, -80, 26, -112, 27, -116, 28, -104, 29, -115, 31, -111],
	#[1, 74, 8, 74, 13, 74, 14, 74, 15, -150, 25, 74, 49, 74, 55, 74],
	#[23, -108, 4, -51, 10, -80, 24, -103, 19, -121, 18, -125, 27, -116, 26, -112, 28, -104, 29, -115, 30, -113, 31, -111],
	#[23, -108, 4, -51, 10, -80, 19, -121, 18, -125, 24, -103, 26, -112, 27, -116, 28, -104, 29, -115, 30, -113, 31, -111],
	#[1, 78, 8, 78, 13, 78, 14, 78, 15, 78, 16, 78, 17, 78, 18, -146, 19, -145, 25, 78, 49, 78, 55, 78],
	#[4, -51, 18, -125, 10, -80, 19, -121, 23, -108, 24, -103, 26, -112, 27, -116, 28, -104, 29, -115, 30, -113, 31, -111],
	#[30, -113, 4, -51, 26, -112, 18, -125, 10, -80, 27, -116, 19, -121, 23, -108, 24, -103, 28, -104, 29, -115, 31, -111],
	#[1, 81, 8, 81, 13, 81, 14, 81, 15, 81, 16, 81, 17, 81, 18, 81, 19, 81, 20, -134, 21, -133, 22, -132, 25, 81, 49, 81, 55, 81],
	#[19, 82, 15, 82, 8, 82, 14, 82, 13, 82, 1, 82, 21, -133, 16, 82, 17, 82, 18, 82, 20, -134, 22, -132, 25, 82, 49, 82, 55, 82],
	#[15, 79, 14, 79, 19, -145, 8, 79, 13, 79, 17, 79, 1, 79, 16, 79, 18, -146, 25, 79, 55, 79, 49, 79],
	#[4, -51, 10, -80, 18, -125, 19, -121, 23, -108, 24, -103, 26, -112, 27, -116, 28, -104, 29, -115, 30, -113, 31, -111],
	#[15, 76, 8, 76, 14, 76, 13, 76, 17, -142, 1, 76, 16, -143, 25, 76, 55, 76, 49, 76],
	#[4, -51, 10, -80, 18, -125, 19, -121, 23, -108, 24, -103, 26, -112, 27, -116, 28, -104, 29, -115, 30, -113, 31, -111],
	#[1, 72, 8, 72, 13, 72, 14, -140, 25, 72, 49, 72, 55, 72],
	#[65535, 214, 4, 214, 9, 214, 49, 214],
	#[49, -157],
	#[65535, 218, 49, 218],
	#[65535, 219, 4, 219, 9, 219, 49, 219],
	#[65535, 136, 4, 136, 9, 136, 25, 136, 49, 136],
	#[65535, 143, 4, 143, 9, 143, 49, 143],
	#[2, -9, 4, -51, 6, 154, 10, -80, 33, -96, 34, -55, 35, -77, 36, -87, 37, -92, 38, -72, 39, -78, 40, -90, 41, -59, 42, -65, 43, -35, 44, -30, 48, -21, 50, -66, 52, -56, 53, -67],
	#[65535, 156, 2, 156, 4, 156, 6, 156, 10, 156, 34, 156, 33, 156, 53, 156, 35, 156, 36, 156, 37, 156, 38, 156, 39, 156, 40, 156, 41, 156, 42, 156, 43, 156, 44, 156, 48, 156, 50, 156, 52, 156],
	#[65535, 207, 4, 207, 10, 207, 18, 207, 19, 207, 23, 207, 24, 207, 26, 207, 27, 207, 28, 207, 29, 207, 30, 207, 31, 207],
	#[65535, 206, 4, 206, 9, 206, 49, 206],
	#[65535, 162, 45, 162],
	#[45, -166],
	#[65535, 163, 24, 163],
	#[24, -168],
	#[65535, 164, 4, 164, 10, 164, 33, 164, 34, 164, 35, 164, 38, 164, 39, 164, 40, 164, 41, 164, 48, 164],
	#[4, -51, 10, -80, 33, -173, 34, -55, 35, -77, 38, -72, 39, -78, 40, -90, 41, -59, 48, -21],
	#[65535, 165, 25, 165],
	#[65535, 175, 25, 175],
	#[25, -179],
	#[25, 135, 33, -158],
	#[65535, 171, 25, 171],
	#[65535, 174, 25, 174],
	#[10, -80, 25, 176],
	#[65535, 173, 25, 173],
	#[65535, 172, 25, 172],
	#[65535, 166, 5, 166],
	#[4, 138, 9, 138, 25, 138, 33, -182, 49, 138],
	#[65535, 140, 4, 140, 9, 140, 25, 140, 49, 140],
	#[65535, 139, 4, 139, 9, 139, 25, 139, 49, 139],
	#[65535, 195, 5, 195],
	#[5, -185],
	#[65535, 196, 4, 196],
	#[4, -187],
	#[65535, 204, 6, 204, 9, 204],
	#[65535, 197, 6, 197],
	#[6, -196],
	#[65535, 202, 6, 202, 9, 202],
	#[6, 200, 9, -194],
	#[4, -187],
	#[65535, 203, 6, 203, 9, 203],
	#[65535, 201, 4, 201],
	#[65535, 199, 1, 199, 4, 199, 25, 199],
	#[65535, 198, 1, 198, 4, 198, 25, 198],
	#[54, -210],
	#[65535, 127, 1, 127, 9, 127],
	#[1, -205],
	#[65535, 158, 1, 158],
	#[1, 131, 9, 131, 25, 131, 54, 222],
	#[65535, 130, 1, 130, 9, 130, 25, 130],
	#[65535, 129, 1, 129, 9, 129, 25, 129],
	#[65535, 132, 1, 132, 9, 132, 25, 132],
	#[65535, 159, 39, 159, 2, 159, 4, 159, 6, 159, 10, 159, 38, 159, 33, 159, 44, 159, 34, 159, 35, 159, 36, 159, 37, 159, 50, 159, 40, 159, 41, 159, 42, 159, 43, 159, 48, 159, 52, 159, 53, 159],
	#[1, 125, 9, -218],
	#[4, -51],
	#[65535, 128, 1, 128, 9, 128],
	#[65535, 225, 1, 225, 9, 225, 25, 225, 54, 225],
	#[65535, 227, 4, 227, 10, 227, 18, 227, 19, 227, 23, 227, 24, 227, 26, 227, 27, 227, 28, 227, 29, 227, 30, 227, 31, 227],
	#[31, -111, 4, -51, 10, -80, 18, -125, 19, -121, 23, -108, 24, -103, 26, -112, 27, -116, 28, -104, 29, -115, 30, -113],
	#[65535, 223, 1, 223, 9, 223, 25, 223],
	#[55, -215],
	#[65535, 228, 55, 228],
	#[65535, 229, 1, 229, 9, 229, 25, 229, 54, 229],
	#[1, 224, 9, 224, 25, 224, 54, -210],
	#[65535, 226, 1, 226, 9, 226, 25, 226, 54, 226],
	#[65535, 126, 4, 126],
	#[65535, 160, 2, 160, 4, 160, 6, 160, 10, 160, 44, 160, 50, 160, 33, 160, 34, 160, 35, 160, 36, 160, 37, 160, 38, 160, 39, 160, 40, 160, 41, 160, 42, 160, 43, 160, 48, 160, 52, 160, 53, 160],
	#[65535, 9, 10, 9, 0, 9, 2, 9, 3, 9, 4, 9, 6, 9, 7, 9, 60, 9, 39, 9, 11, 9, 53, 9, 47, 9, 36, 9, 59, 9, 35, 9, 46, 9, 33, 9, 44, 9, 50, 9, 43, 9, 32, 9, 34, 9, 58, 9, 37, 9, 38, 9, 40, 9, 41, 9, 42, 9, 57, 9, 48, 9, 56, 9, 52, 9, 61, 9],
	#[65535, 211, 4, 211, 10, 211, 33, 211, 34, 211, 35, 211, 36, 211, 37, 211, 38, 211, 39, 211, 40, 211, 41, 211, 42, 211, 50, 211, 52, 211, 53, 211],
	#[4, -51, 10, -80, 33, -96, 34, -55, 35, -77, 36, -87, 37, -92, 38, -72, 39, -78, 40, -90, 41, -59, 42, -65, 50, -66, 52, -56, 53, -67],
	#[65535, 209, 9, 209, 49, 209],
	#[65535, 212, 4, 212, 10, 212, 18, 212, 19, 212, 23, 212, 24, 212, 26, 212, 27, 212, 28, 212, 29, 212, 30, 212, 31, 212],
	#[65535, 217, 4, 217, 10, 217, 18, 217, 19, 217, 23, 217, 24, 217, 26, 217, 27, 217, 28, 217, 29, 217, 30, 217, 31, 217],
	#[65535, 208, 49, 208],
	#[49, -228],
	#[65535, 205, 4, 205, 9, 205, 49, 205],
	#[46, -241, 2, -9, 47, -237],
	#[65535, 167, 2, 167, 46, 167, 47, 167],
	#[8, -255],
	#[1, -220],
	#[65535, 168, 6, 168],
	#[65535, 180, 4, 180, 10, 180, 38, 180, 44, 180, 43, 180, 33, 180, 34, 180, 35, 180, 36, 180, 37, 180, 39, 180, 40, 180, 41, 180, 42, 180, 48, 180, 50, 180, 52, 180, 53, 180],
	#[65535, 178, 6, 178, 2, 178, 46, 178, 47, 178],
	#[65535, 185, 4, 185, 10, 185, 33, 185, 34, 185, 35, 185, 36, 185, 37, 185, 38, 185, 39, 185, 40, 185, 41, 185, 42, 185, 43, 185, 44, 185, 46, 185, 47, 185, 48, 185, 50, 185, 52, 185, 53, 185],
	#[65535, 188, 4, 188, 19, 188, 18, 188, 10, 188, 23, 188, 24, 188, 26, 188, 27, 188, 28, 188, 29, 188, 30, 188, 31, 188],
	#[27, -116, 10, -80, 4, -51, 30, -113, 18, -125, 19, -121, 23, -108, 24, -103, 26, -112, 28, -104, 29, -115, 31, -111],
	#[6, -249],
	#[4, -51, 10, -80, 38, -72, 44, -30, 42, -65, 33, -96, 34, -55, 35, -77, 36, -87, 37, -92, 39, -78, 40, -90, 41, -59, 43, -35, 48, -21, 50, -66, 52, -56, 53, -67],
	#[65535, 187, 8, 187],
	#[65535, 181, 1, 181],
	#[65535, 192, 4, 192],
	#[4, -51],
	#[1, -246],
	#[65535, 182, 6, 182, 2, 182, 46, 182, 47, 182],
	#[65535, 193, 1, 193],
	#[65535, 170, 1, 170, 4, 170],
	#[65535, 169, 1, 169, 4, 169],
	#[8, -252],
	#[65535, 189, 8, 189],
	#[65535, 191, 4, 191, 10, 191, 38, 191, 34, 191, 44, 191, 33, 191, 41, 191, 35, 191, 36, 191, 37, 191, 39, 191, 40, 191, 42, 191, 43, 191, 46, 191, 47, 191, 48, 191, 50, 191, 52, 191, 53, 191],
	#[44, 184, 37, 184, 39, 184, 4, 184, 10, 184, 38, 184, 43, 184, 42, 184, 33, 184, 34, 184, 35, 184, 36, 184, 50, 184, 40, 184, 41, 184, 46, -241, 47, -237, 48, 184, 52, 184, 53, 184],
	#[65535, 186, 4, 186, 10, 186, 44, 186, 50, 186, 33, 186, 34, 186, 35, 186, 36, 186, 37, 186, 38, 186, 39, 186, 40, 186, 41, 186, 42, 186, 43, 186, 46, 186, 47, 186, 48, 186, 52, 186, 53, 186],
	#[65535, 190, 4, 190, 10, 190, 38, 190, 34, 190, 44, 190, 33, 190, 41, 190, 35, 190, 36, 190, 37, 190, 39, 190, 40, 190, 42, 190, 43, 190, 46, 190, 47, 190, 48, 190, 50, 190, 52, 190, 53, 190],
	#[2, -9, 6, 177, 47, -237, 46, -241],
	#[65535, 179, 2, 179, 6, 179, 46, 179, 47, 179],
	#[65535, 183, 2, 183, 6, 183, 46, 183, 47, 183],
	#[65535, 153, 4, 153, 1, 153],
	#[65535, 36, 36, 36, 4, 36, 10, 36, 2, 36, 6, 36, 39, 36, 11, 36, 44, 36, 32, 36, 33, 36, 34, 36, 35, 36, 37, 36, 38, 36, 50, 36, 40, 36, 41, 36, 42, 36, 43, 36, 48, 36, 52, 36, 53, 36, 56, 36, 57, 36, 58, 36, 59, 36, 60, 36, 61, 36],
	#[65535, 33, 4, 33, 10, 33, 2, 33, 6, 33, 39, 33, 11, 33, 44, 33, 42, 33, 32, 33, 33, 33, 34, 33, 35, 33, 36, 33, 37, 33, 38, 33, 50, 33, 40, 33, 41, 33, 43, 33, 48, 33, 52, 33, 53, 33, 56, 33, 57, 33, 58, 33, 59, 33, 60, 33, 61, 33],
	#[6, -369],
	#[39, 242, 4, 242, 2, -9, 6, 34, 10, 242, 11, -24, 44, -30, 42, 242, 32, -33, 33, 242, 34, 242, 35, 242, 36, 242, 37, 242, 38, 242, 50, 242, 40, 242, 41, 242, 43, -35, 48, -21, 52, 242, 53, 242, 56, 232, 57, -276, 58, -16, 59, -271, 60, -277, 61, 242],
	#[1, -220],
	#[1, -220],
	#[24, -322],
	#[56, -319],
	#[65535, 38, 1, 38],
	#[1, -220],
	#[4, -51, 10, -80, 38, -72, 34, -55, 42, -65, 33, -96, 41, -59, 35, -77, 36, -87, 37, -92, 39, -78, 40, -90, 61, -313, 50, -66, 52, -56, 53, -67],
	#[65535, 243, 4, 243, 10, 243, 33, 243, 34, 243, 35, 243, 36, 243, 37, 243, 38, 243, 39, 243, 40, 243, 41, 243, 42, 243, 50, 243, 52, 243, 53, 243, 61, 243],
	#[65535, 39, 1, 39],
	#[1, -220],
	#[1, -220],
	#[4, -51, 10, -80, 33, -96, 34, -55, 35, -77, 36, -87, 37, -92, 38, -72, 39, -78, 40, -90, 41, -59, 42, -65, 50, -66, 52, -56, 53, -67],
	#[65535, 233, 56, 233],
	#[65535, 244, 4, 244, 10, 244, 33, 244, 34, 244, 35, 244, 36, 244, 37, 244, 38, 244, 39, 244, 40, 244, 41, 244, 42, 244, 50, 244, 52, 244, 53, 244, 61, 244],
	#[65535, 37, 2, 37, 4, 37, 6, 37, 10, 37, 11, 37, 44, 37, 32, 37, 33, 37, 34, 37, 35, 37, 36, 37, 37, 37, 38, 37, 39, 37, 40, 37, 41, 37, 42, 37, 43, 37, 48, 37, 50, 37, 52, 37, 53, 37, 56, 37, 57, 37, 58, 37, 59, 37, 60, 37, 61, 37],
	#[1, -220],
	#[65535, 43, 2, 43, 4, 43, 6, 43, 10, 43, 11, 43, 32, 43, 33, 43, 34, 43, 35, 43, 36, 43, 37, 43, 38, 43, 39, 43, 40, 43, 41, 43, 42, 43, 43, 43, 44, 43, 48, 43, 50, 43, 52, 43, 53, 43, 56, 43, 57, 43, 58, 43, 59, 43, 60, 43, 61, 43],
	#[4, -51],
	#[65535, 235, 4, 235],
	#[65535, 230, 1, 230],
	#[65535, 106, 4, 106],
	#[65535, 102, 1, 102],
	#[4, -51],
	#[65535, 107, 1, 107],
	#[65535, 57, 4, 57],
	#[65535, 64, 4, 64],
	#[4, -51],
	#[65535, 67, 4, 67],
	#[65535, 62, 4, 62],
	#[4, 68, 10, -80],
	#[65535, 66, 4, 66],
	#[65535, 61, 4, 61],
	#[65535, 65, 4, 65],
	#[65535, 63, 4, 63],
	#[65535, 58, 12, 58],
	#[12, -300],
	#[65535, 59, 27, 59, 4, 59, 10, 59, 18, 59, 19, 59, 23, 59, 24, 59, 26, 59, 28, 59, 29, 59, 30, 59, 31, 59],
	#[4, -51, 10, -80, 18, -125, 19, -121, 23, -108, 24, -103, 26, -112, 27, -116, 28, -104, 29, -115, 30, -113, 31, -111],
	#[65535, 60, 1, 60],
	#[65535, 69, 1, 69],
	#[5, -306],
	#[65535, 237, 5, 237],
	#[65535, 238, 2, 238, 4, 238, 6, 238, 10, 238, 33, 238, 34, 238, 35, 238, 36, 238, 37, 238, 38, 238, 39, 238, 40, 238, 41, 238, 42, 238, 43, 238, 44, 238, 48, 238, 50, 238, 52, 238, 53, 238],
	#[65535, 155, 2, 155, 4, 155, 6, 155, 10, 155, 33, 155, 34, 155, 35, 155, 36, 155, 37, 155, 38, 155, 39, 155, 40, 155, 41, 155, 42, 155, 43, 155, 44, 155, 48, 155, 50, 155, 52, 155, 53, 155],
	#[2, -9, 4, -51, 6, 239, 10, -80, 33, -96, 34, -55, 35, -77, 36, -87, 37, -92, 38, -72, 39, -78, 40, -90, 41, -59, 42, -65, 43, -35, 44, -30, 48, -21, 50, -66, 52, -56, 53, -67],
	#[6, -310],
	#[65535, 234, 1, 234],
	#[65535, 42, 43, 42, 11, 42, 38, 42, 2, 42, 4, 42, 6, 42, 10, 42, 32, 42, 33, 42, 34, 42, 35, 42, 36, 42, 37, 42, 39, 42, 40, 42, 41, 42, 42, 42, 60, 42, 44, 42, 48, 42, 50, 42, 52, 42, 53, 42, 56, 42, 57, 42, 58, 42, 59, 42, 61, 42],
	#[65535, 44, 11, 44, 2, 44, 4, 44, 6, 44, 10, 44, 32, 44, 33, 44, 34, 44, 35, 44, 36, 44, 37, 44, 38, 44, 39, 44, 40, 44, 41, 44, 42, 44, 43, 44, 44, 44, 48, 44, 50, 44, 52, 44, 53, 44, 56, 44, 57, 44, 58, 44, 59, 44, 60, 44, 61, 44],
	#[65535, 247, 4, 247],
	#[65535, 245, 4, 245],
	#[65535, 246, 4, 246],
	#[4, -317],
	#[65535, 241, 24, 241],
	#[65535, 40, 2, 40, 4, 40, 6, 40, 10, 40, 11, 40, 38, 40, 43, 40, 35, 40, 32, 40, 33, 40, 34, 40, 52, 40, 36, 40, 37, 40, 39, 40, 40, 40, 41, 40, 42, 40, 60, 40, 44, 40, 48, 40, 50, 40, 53, 40, 56, 40, 57, 40, 58, 40, 59, 40, 61, 40],
	#[65535, 231, 4, 231, 10, 231, 33, 231, 34, 231, 35, 231, 36, 231, 37, 231, 38, 231, 39, 231, 40, 231, 41, 231, 42, 231, 50, 231, 52, 231, 53, 231],
	#[25, -355, 62, -354, 63, -350, 64, -353],
	#[65535, 248, 1, 248, 65, 248, 66, 248],
	#[65535, 252, 25, 252, 64, 252, 62, 252, 63, 252],
	#[1, 264, 65, -327, 66, 264],
	#[1, 270, 66, -337],
	#[24, -328],
	#[65535, 249, 1, 249, 66, 249],
	#[65535, 266, 24, 266],
	#[65535, 267, 4, 267, 10, 267],
	#[10, -80, 4, -51],
	#[5, 48, 9, 48, 10, -80, 25, 48],
	#[25, -332],
	#[65535, 265, 1, 265, 66, 265],
	#[4, -51, 10, -80],
	#[5, 46, 9, -335, 25, 46],
	#[65535, 47, 4, 47, 10, 47],
	#[10, -80, 5, 49, 9, 49, 25, 49],
	#[65535, 268, 24, 268],
	#[24, -341],
	#[65535, 240, 1, 240],
	#[27, -342],
	#[65535, 269, 27, 269],
	#[65535, 274, 9, 274, 25, 274],
	#[25, -344],
	#[65535, 271, 1, 271],
	#[9, -348, 25, 273],
	#[27, -347],
	#[65535, 275, 9, 275, 25, 275],
	#[65535, 272, 27, 272],
	#[65535, 250, 1, 250, 65, 250, 66, 250],
	#[65535, 262, 4, 262, 39, 262, 42, 262, 34, 262, 36, 262, 33, 262, 35, 262, 10, 262, 41, 262, 53, 262, 52, 262, 37, 262, 38, 262, 40, 262, 50, 262],
	#[52, -56, 36, -87, 34, -55, 39, -78, 42, -65, 40, -90, 4, -51, 33, -96, 41, -59, 35, -77, 10, -80, 38, -72, 37, -92, 50, -66, 53, -67],
	#[65535, 255, 9, 255, 25, 255],
	#[65535, 263, 37, 263, 39, 263, 38, 263, 33, 263, 52, 263, 36, 263, 4, 263, 35, 263, 10, 263, 34, 263, 40, 263, 41, 263, 42, 263, 50, 263, 53, 263],
	#[65535, 261, 52, 261, 53, 261, 37, 261, 39, 261, 38, 261, 33, 261, 36, 261, 4, 261, 10, 261, 35, 261, 34, 261, 40, 261, 50, 261, 41, 261, 42, 261],
	#[65535, 253, 1, 253, 66, 253, 65, 253],
	#[25, -355],
	#[65535, 259, 39, 259, 36, 259, 4, 259, 10, 259, 33, 259, 38, 259, 37, 259, 35, 259, 34, 259, 40, 259, 41, 259, 42, 259, 50, 259, 52, 259, 53, 259],
	#[65535, 251, 1, 251, 65, 251, 66, 251],
	#[62, -354, 63, -350, 64, -353],
	#[9, -361, 25, 254],
	#[65535, 257, 62, 257, 63, 257, 64, 257],
	#[65535, 256, 9, 256, 25, 256],
	#[4, -51],
	#[65535, 260, 4, 260],
	#[65535, 258, 9, 258, 25, 258],
	#[65535, 41, 39, 41, 6, 41, 35, 41, 32, 41, 10, 41, 4, 41, 2, 41, 59, 41, 33, 41, 48, 41, 11, 41, 56, 41, 44, 41, 43, 41, 42, 41, 34, 41, 52, 41, 36, 41, 37, 41, 38, 41, 40, 41, 41, 41, 57, 41, 50, 41, 53, 41, 58, 41, 60, 41, 61, 41],
	#[65535, 45, 4, 45, 37, 45, 2, 45, 43, 45, 36, 45, 39, 45, 32, 45, 10, 45, 52, 45, 34, 45, 44, 45, 48, 45, 38, 45, 33, 45, 6, 45, 11, 45, 56, 45, 35, 45, 57, 45, 40, 45, 41, 45, 42, 45, 50, 45, 53, 45, 58, 45, 59, 45, 60, 45, 61, 45],
	#[65535, 24, 1, 24],
	#[65535, 35, 1, 35],
	#[65535, 32, 4, 32, 10, 32],
	#[10, -80, 4, -51],
	#[65535, 26, 5, 26],
	#[65535, 31, 5, 31],
	#[65535, 5, 2, 5, 44, 5, 3, 5, 0, 5, 6, 5, 7, 5, 11, 5, 43, 5, 32, 5, 48, 5, 58, 5],
	#[65535, 7, 44, 7, 6, 7, 3, 7, 0, 7, 2, 7, 7, 7, 11, 7, 43, 7, 32, 7, 48, 7, 58, 7],
	#[65535, 3, 3, 3, 0, 3, 2, 3, 6, 3, 7, 3, 11, 3, 32, 3, 43, 3, 44, 3, 48, 3, 58, 3],
	#[65535, 29, 8, 29, 1, 29, 5, 29],
	#[65535, 27, 1, 27, 8, 27, 5, 27],
	#[65535, 4, 7, 4, 6, 4, 2, 4, 0, 4, 3, 4, 11, 4, 32, 4, 43, 4, 44, 4, 48, 4, 58, 4],
	#[65535, 8, 2, 8, 0, 8, 3, 8, 6, 8, 7, 8, 11, 8, 43, 8, 32, 8, 48, 8, 44, 8, 58, 8],
	#[65535, 6, 43, 6, 7, 6, 11, 6, 2, 6, 32, 6, 0, 6, 3, 6, 6, 6, 44, 6, 48, 6, 58, 6]],
  goto-table:
      #[#[68, 1],
	#[217, 22, 215, 38, 186, 28, 181, 14, 166, 26, 162, 37, 157, 31, 151, 6, 147, 39, 125, 27, 124, 25, 110, 17, 106, 35, 105, 9, 88, 10, 87, 33, 86, 12, 85, 36, 84, 16, 83, 4, 78, 40, 77, 19, 76, 5, 75, 18, 74, 2, 73, 21, 72, 7, 71, 13, 69, 11, 58, 15, 48, 20, 44, 29, 43, 34, 32, 32, 11, 23, 7, 24, 3, 30, 2, 8, 0, 3],
	#[70, 380, 1, 219],
	#[],
	#[],
	#[70, 379, 1, 219],
	#[],
	#[1, 219, 70, 378],
	#[],
	#[],
	#[104, 376, 89, 377, 4, 50],
	#[],
	#[],
	#[70, 375, 1, 219],
	#[182, 183, 104, 182, 4, 50],
	#[],
	#[],
	#[],
	#[70, 374, 1, 219],
	#[],
	#[],
	#[70, 373, 1, 219],
	#[218, 303, 104, 304, 4, 50],
	#[],
	#[],
	#[201, 99, 200, 62, 199, 75, 197, 101, 195, 88, 194, 82, 192, 60, 191, 72, 203, 69, 186, 87, 181, 14, 166, 63, 162, 37, 151, 78, 146, 94, 144, 68, 142, 98, 141, 61, 140, 73, 145, 56, 147, 39, 139, 92, 128, 283, 131, 81, 129, 59, 130, 96, 104, 84, 103, 85, 157, 31, 132, 80, 204, 57, 126, 285, 102, 100, 127, 284, 143, 83, 53, 66, 52, 55, 50, 65, 44, 29, 48, 20, 42, 64, 41, 58, 40, 89, 39, 77, 38, 71, 34, 54, 33, 95, 43, 34, 35, 76, 36, 86, 37, 91, 10, 79, 4, 50],
	#[],
	#[],
	#[],
	#[],
	#[],
	#[158, 164, 104, 163, 4, 50],
	#[],
	#[91, 370, 90, 371, 8, 369],
	#[],
	#[204, 57, 203, 290, 201, 99, 199, 293, 197, 101, 200, 62, 145, 288, 144, 296, 143, 291, 142, 295, 141, 61, 140, 73, 139, 294, 107, 289, 104, 84, 102, 100, 111, 287, 103, 292, 53, 66, 52, 55, 41, 58, 40, 89, 35, 76, 4, 50, 34, 54, 38, 71, 39, 77, 33, 95, 10, 79, 36, 86, 37, 91],
	#[92, 259, 5, 260],
	#[163, 228, 5, 229],
	#[],
	#[148, 49, 104, 51, 4, 50],
	#[79, 41, 4, 42],
	#[80, 44, 5, 43],
	#[],
	#[],
	#[81, 46, 68, 45],
	#[217, 22, 215, 38, 186, 28, 181, 14, 166, 26, 162, 37, 157, 31, 151, 6, 147, 39, 125, 27, 124, 25, 110, 17, 106, 35, 105, 9, 88, 10, 87, 33, 86, 12, 85, 36, 84, 16, 83, 4, 78, 40, 77, 19, 76, 5, 75, 18, 74, 2, 73, 21, 72, 7, 71, 13, 69, 11, 58, 15, 48, 20, 32, 32, 43, 34, 11, 23, 44, 29, 7, 24, 2, 8, 3, 30],
	#[82, 47, 6, 48],
	#[],
	#[],
	#[149, 53, 5, 52],
	#[],
	#[],
	#[],
	#[204, 57, 203, 69, 201, 99, 200, 62, 199, 75, 197, 101, 195, 88, 194, 82, 191, 72, 192, 60, 186, 87, 181, 14, 166, 63, 162, 37, 157, 31, 156, 93, 154, 67, 151, 78, 150, 90, 152, 97, 146, 94, 145, 56, 144, 68, 143, 83, 142, 98, 141, 61, 140, 73, 132, 80, 131, 81, 130, 96, 129, 59, 128, 70, 139, 92, 147, 39, 104, 84, 103, 85, 102, 100, 76, 74, 53, 66, 52, 55, 50, 65, 42, 64, 41, 58, 48, 20, 43, 34, 34, 54, 40, 89, 33, 95, 35, 76, 39, 77, 10, 79, 44, 29, 4, 50, 38, 71, 2, 8, 37, 91, 36, 86],
	#[],
	#[],
	#[],
	#[51, 224],
	#[],
	#[],
	#[193, 226, 123, 225, 122, 105, 121, 117, 120, 113, 119, 121, 118, 104, 117, 116, 116, 106, 115, 118, 114, 108, 113, 122, 104, 84, 103, 109, 102, 100, 31, 110, 30, 112, 29, 114, 28, 103, 27, 115, 26, 111, 24, 102, 23, 107, 19, 120, 18, 124, 10, 79, 4, 50],
	#[],
	#[51, 223],
	#[],
	#[],
	#[],
	#[],
	#[205, 196, 206, 203, 133, 199, 136, 197, 137, 202, 104, 200, 138, 201, 155, 198, 4, 50],
	#[],
	#[],
	#[],
	#[],
	#[],
	#[],
	#[70, 218, 1, 219],
	#[],
	#[34, 180, 33, 179],
	#[],
	#[],
	#[],
	#[],
	#[],
	#[49, 162, 9, 161],
	#[],
	#[],
	#[102, 127, 10, 79],
	#[],
	#[],
	#[196, 221, 51, 220],
	#[],
	#[6, 258],
	#[],
	#[],
	#[153, 159],
	#[],
	#[36, 158, 33, 157],
	#[],
	#[],
	#[],
	#[202, 154, 123, 155, 122, 105, 121, 117, 120, 113, 119, 121, 118, 104, 117, 116, 116, 106, 115, 118, 114, 108, 113, 122, 104, 84, 103, 109, 102, 100, 31, 110, 30, 112, 29, 114, 28, 103, 26, 111, 24, 102, 23, 107, 19, 120, 18, 124, 27, 115, 10, 79, 4, 50],
	#[104, 126, 4, 50],
	#[122, 105, 121, 117, 120, 113, 119, 121, 118, 104, 117, 116, 116, 106, 115, 118, 114, 108, 113, 122, 104, 84, 103, 109, 102, 100, 31, 110, 30, 112, 28, 103, 27, 115, 26, 111, 24, 102, 23, 107, 19, 120, 18, 124, 29, 114, 4, 50, 10, 79, 198, 119, 123, 123],
	#[122, 105, 121, 117, 120, 113, 119, 121, 117, 116, 116, 106, 115, 118, 114, 108, 113, 129, 104, 84, 103, 109, 102, 100, 118, 104, 31, 110, 30, 112, 29, 114, 28, 103, 27, 115, 26, 111, 24, 102, 19, 120, 18, 124, 10, 79, 4, 50, 23, 107],
	#[],
	#[19, 144, 18, 145],
	#[],
	#[15, 149],
	#[122, 105, 121, 136, 104, 84, 103, 109, 102, 100, 31, 110, 30, 112, 29, 114, 28, 103, 27, 115, 26, 111, 24, 102, 10, 79, 4, 50],
	#[13, 151],
	#[102, 127, 10, 79],
	#[],
	#[],
	#[],
	#[],
	#[],
	#[],
	#[17, 141, 16, 142],
	#[],
	#[14, 139],
	#[49, 153],
	#[122, 105, 121, 135, 104, 84, 103, 109, 102, 100, 31, 110, 30, 112, 29, 114, 28, 103, 27, 115, 26, 111, 24, 102, 10, 79, 4, 50],
	#[22, 131, 21, 132, 20, 133],
	#[],
	#[],
	#[122, 105, 121, 125, 104, 84, 103, 109, 102, 100, 28, 103, 26, 111, 24, 102, 27, 115, 10, 79, 30, 112, 4, 50, 31, 110, 29, 114],
	#[],
	#[],
	#[104, 128, 4, 50],
	#[],
	#[25, 130],
	#[],
	#[122, 105, 121, 117, 120, 138, 104, 84, 103, 109, 102, 100, 31, 110, 30, 112, 29, 114, 28, 103, 27, 115, 26, 111, 24, 102, 23, 107, 19, 120, 18, 124, 10, 79, 4, 50],
	#[121, 117, 120, 137, 122, 105, 103, 109, 102, 100, 104, 84, 24, 102, 27, 115, 19, 120, 26, 111, 28, 103, 10, 79, 18, 124, 30, 112, 23, 107, 4, 50, 31, 110, 29, 114],
	#[121, 117, 104, 84, 102, 100, 120, 134, 122, 105, 28, 103, 27, 115, 26, 111, 24, 102, 23, 107, 19, 120, 18, 124, 103, 109, 4, 50, 31, 110, 10, 79, 30, 112, 29, 114],
	#[],
	#[],
	#[],
	#[],
	#[],
	#[122, 105, 121, 117, 120, 113, 119, 121, 118, 104, 117, 116, 104, 84, 103, 109, 102, 100, 116, 140, 30, 112, 29, 114, 28, 103, 27, 115, 26, 111, 24, 102, 23, 107, 4, 50, 18, 124, 19, 120, 10, 79, 31, 110],
	#[15, 149],
	#[122, 105, 121, 117, 120, 113, 119, 121, 118, 148, 104, 84, 102, 100, 30, 112, 24, 102, 103, 109, 26, 111, 27, 115, 28, 103, 19, 120, 18, 124, 4, 50, 10, 79, 23, 107, 29, 114, 31, 110],
	#[122, 105, 120, 113, 104, 84, 118, 143, 119, 121, 121, 117, 31, 110, 30, 112, 29, 114, 28, 103, 27, 115, 26, 111, 24, 102, 23, 107, 18, 124, 10, 79, 19, 120, 4, 50, 103, 109, 102, 100],
	#[19, 144, 18, 145],
	#[122, 105, 121, 117, 119, 147, 120, 113, 104, 84, 103, 109, 102, 100, 31, 110, 29, 114, 28, 103, 27, 115, 24, 102, 23, 107, 19, 120, 18, 124, 26, 111, 10, 79, 4, 50, 30, 112],
	#[122, 105, 121, 117, 120, 113, 119, 146, 104, 84, 103, 109, 102, 100, 31, 110, 30, 112, 29, 114, 28, 103, 27, 115, 26, 111, 24, 102, 19, 120, 10, 79, 18, 124, 4, 50, 23, 107],
	#[22, 131, 21, 132, 20, 133],
	#[22, 131, 20, 133, 21, 132],
	#[19, 144, 18, 145],
	#[122, 105, 121, 117, 120, 113, 119, 121, 118, 104, 117, 150, 104, 84, 103, 109, 102, 100, 31, 110, 28, 103, 27, 115, 26, 111, 24, 102, 23, 107, 18, 124, 29, 114, 30, 112, 19, 120, 4, 50, 10, 79],
	#[17, 141, 16, 142],
	#[122, 105, 118, 104, 117, 116, 116, 106, 120, 113, 104, 84, 121, 117, 115, 152, 102, 100, 103, 109, 119, 121, 31, 110, 30, 112, 29, 114, 28, 103, 26, 111, 24, 102, 23, 107, 19, 120, 18, 124, 27, 115, 10, 79, 4, 50],
	#[14, 139],
	#[],
	#[49, 156],
	#[],
	#[],
	#[],
	#[],
	#[204, 57, 203, 69, 201, 99, 200, 62, 199, 75, 197, 101, 195, 88, 194, 82, 192, 60, 191, 72, 186, 87, 181, 14, 166, 63, 162, 37, 157, 31, 156, 160, 154, 67, 151, 78, 147, 39, 146, 94, 145, 56, 144, 68, 143, 83, 142, 98, 141, 61, 140, 73, 139, 92, 132, 80, 131, 81, 130, 96, 129, 59, 128, 70, 104, 84, 103, 85, 102, 100, 76, 74, 53, 66, 52, 55, 50, 65, 48, 20, 44, 29, 43, 34, 42, 64, 41, 58, 40, 89, 38, 71, 37, 91, 36, 86, 35, 76, 34, 54, 33, 95, 10, 79, 4, 50, 2, 8, 39, 77],
	#[],
	#[],
	#[],
	#[],
	#[159, 166, 45, 165],
	#[],
	#[160, 168, 24, 167],
	#[],
	#[181, 14, 186, 170, 167, 169, 161, 171, 145, 174, 144, 176, 143, 177, 141, 61, 140, 73, 139, 173, 104, 84, 103, 175, 102, 100, 48, 20, 41, 58, 40, 89, 39, 77, 38, 71, 35, 76, 34, 54, 33, 172, 10, 79, 4, 50],
	#[],
	#[],
	#[25, 178],
	#[33, 157],
	#[],
	#[],
	#[102, 127, 10, 79],
	#[],
	#[],
	#[],
	#[33, 181],
	#[],
	#[],
	#[],
	#[183, 185, 5, 184],
	#[],
	#[190, 189, 187, 187, 184, 188, 4, 186],
	#[],
	#[],
	#[185, 194, 6, 195],
	#[189, 190, 188, 191],
	#[9, 193],
	#[190, 192, 4, 186],
	#[],
	#[],
	#[],
	#[],
	#[54, 209, 211, 208, 209, 210, 207, 211],
	#[135, 205, 134, 206],
	#[1, 204],
	#[],
	#[],
	#[],
	#[],
	#[],
	#[],
	#[9, 217],
	#[206, 203, 205, 196, 138, 201, 137, 202, 136, 207, 104, 200, 4, 50],
	#[],
	#[208, 215],
	#[],
	#[210, 212, 123, 213, 122, 105, 121, 117, 120, 113, 119, 121, 118, 104, 117, 116, 116, 106, 115, 118, 114, 108, 113, 122, 104, 84, 103, 109, 102, 100, 28, 103, 24, 102, 19, 120, 26, 111, 27, 115, 29, 114, 4, 50, 10, 79, 18, 124, 23, 107, 30, 112, 31, 110],
	#[],
	#[55, 214],
	#[],
	#[],
	#[211, 216, 209, 210, 54, 209],
	#[],
	#[],
	#[],
	#[],
	#[],
	#[204, 57, 203, 69, 201, 99, 200, 62, 199, 75, 197, 101, 195, 88, 194, 82, 192, 60, 191, 72, 146, 94, 145, 56, 143, 83, 142, 98, 141, 61, 140, 73, 144, 68, 130, 96, 139, 92, 131, 81, 129, 222, 104, 84, 103, 85, 102, 100, 53, 66, 52, 55, 50, 65, 42, 64, 41, 58, 40, 89, 39, 77, 38, 71, 37, 91, 36, 86, 35, 76, 34, 54, 33, 95, 10, 79, 4, 50],
	#[],
	#[],
	#[],
	#[],
	#[49, 227],
	#[],
	#[176, 237, 173, 233, 168, 232, 164, 238, 172, 234, 175, 230, 170, 239, 178, 235, 46, 240, 76, 231, 2, 8, 47, 236],
	#[],
	#[8, 254],
	#[70, 257, 1, 219],
	#[],
	#[],
	#[169, 255],
	#[174, 252],
	#[],
	#[177, 249, 121, 117, 119, 121, 118, 104, 117, 116, 116, 106, 115, 118, 114, 108, 113, 250, 104, 84, 103, 109, 102, 100, 122, 105, 120, 113, 31, 110, 30, 112, 29, 114, 28, 103, 27, 115, 26, 111, 24, 102, 23, 107, 19, 120, 18, 124, 10, 79, 4, 50],
	#[165, 247, 6, 248],
	#[200, 62, 199, 75, 197, 101, 195, 88, 194, 82, 192, 60, 191, 72, 203, 69, 204, 57, 181, 14, 201, 99, 179, 243, 186, 87, 166, 63, 180, 241, 162, 37, 171, 244, 157, 31, 151, 78, 147, 39, 146, 94, 145, 56, 144, 68, 143, 83, 142, 98, 141, 61, 140, 73, 132, 80, 129, 59, 128, 242, 131, 81, 104, 84, 103, 85, 102, 100, 139, 92, 130, 96, 53, 66, 52, 55, 50, 65, 48, 20, 44, 29, 43, 34, 42, 64, 41, 58, 40, 89, 39, 77, 38, 71, 37, 91, 36, 86, 35, 76, 34, 54, 33, 95, 10, 79, 4, 50],
	#[],
	#[],
	#[],
	#[206, 203, 205, 196, 137, 202, 138, 201, 136, 246, 104, 200, 4, 50],
	#[1, 245],
	#[],
	#[],
	#[],
	#[],
	#[8, 251],
	#[],
	#[],
	#[175, 230, 176, 237, 178, 253, 47, 236, 46, 240],
	#[],
	#[],
	#[176, 237, 173, 233, 178, 235, 170, 239, 175, 230, 172, 256, 76, 231, 47, 236, 46, 240, 2, 8],
	#[],
	#[],
	#[],
	#[95, 262, 93, 261],
	#[],
	#[94, 367, 6, 368],
	#[223, 269, 222, 265, 217, 22, 215, 38, 214, 266, 213, 274, 212, 267, 221, 271, 186, 28, 181, 14, 166, 26, 162, 37, 157, 31, 151, 6, 147, 39, 125, 27, 110, 17, 124, 25, 106, 35, 98, 277, 97, 272, 96, 278, 76, 263, 73, 273, 72, 264, 71, 268, 59, 270, 58, 15, 57, 275, 44, 29, 48, 20, 32, 32, 43, 34, 60, 276, 11, 23, 2, 8],
	#[70, 366, 1, 219],
	#[1, 219, 70, 365],
	#[229, 319, 228, 320, 226, 322, 24, 321],
	#[56, 318],
	#[],
	#[70, 317, 1, 219],
	#[224, 315, 225, 313, 204, 57, 203, 69, 201, 99, 200, 62, 199, 75, 197, 101, 194, 82, 192, 60, 191, 72, 195, 88, 146, 94, 145, 56, 144, 68, 143, 83, 142, 98, 141, 61, 140, 73, 139, 92, 131, 81, 130, 96, 129, 314, 104, 84, 102, 100, 103, 85, 61, 312, 53, 66, 52, 55, 50, 65, 41, 58, 40, 89, 39, 77, 38, 71, 37, 91, 36, 86, 35, 76, 34, 54, 33, 95, 42, 64, 10, 79, 4, 50],
	#[],
	#[],
	#[70, 311, 1, 219],
	#[70, 310, 1, 219],
	#[216, 280, 204, 57, 200, 62, 197, 101, 192, 60, 191, 72, 201, 99, 195, 88, 203, 69, 194, 82, 146, 94, 143, 83, 141, 61, 140, 73, 139, 92, 144, 68, 145, 56, 130, 96, 129, 281, 142, 98, 131, 81, 104, 84, 102, 100, 103, 85, 199, 75, 53, 66, 52, 55, 50, 65, 42, 64, 41, 58, 40, 89, 39, 77, 38, 71, 37, 91, 36, 86, 35, 76, 33, 95, 10, 79, 4, 50, 34, 54],
	#[],
	#[],
	#[],
	#[70, 279, 1, 219],
	#[],
	#[205, 196, 206, 203, 133, 282, 136, 197, 138, 201, 137, 202, 104, 200, 4, 50],
	#[],
	#[],
	#[],
	#[],
	#[138, 201, 137, 202, 136, 197, 133, 286, 104, 200, 4, 50, 206, 203, 205, 196],
	#[],
	#[],
	#[],
	#[104, 297, 108, 298, 4, 50],
	#[],
	#[],
	#[102, 127, 10, 79],
	#[],
	#[],
	#[],
	#[],
	#[],
	#[109, 300, 12, 299],
	#[],
	#[122, 105, 121, 117, 120, 113, 119, 121, 118, 104, 117, 116, 116, 106, 115, 118, 114, 108, 113, 302, 112, 301, 104, 84, 103, 109, 102, 100, 30, 112, 29, 114, 28, 103, 24, 102, 23, 107, 19, 120, 18, 124, 26, 111, 27, 115, 31, 110, 10, 79, 4, 50],
	#[],
	#[],
	#[219, 306, 5, 305],
	#[],
	#[],
	#[220, 308, 153, 307],
	#[204, 57, 201, 99, 200, 62, 199, 75, 197, 101, 194, 82, 203, 69, 181, 14, 195, 88, 192, 60, 166, 63, 186, 87, 162, 37, 156, 160, 154, 67, 151, 78, 147, 39, 146, 94, 145, 56, 144, 68, 143, 83, 142, 98, 141, 61, 140, 73, 139, 92, 157, 31, 131, 81, 130, 96, 128, 70, 129, 59, 191, 72, 103, 85, 102, 100, 104, 84, 132, 80, 76, 74, 53, 66, 52, 55, 50, 65, 48, 20, 44, 29, 43, 34, 42, 64, 41, 58, 40, 89, 39, 77, 38, 71, 34, 54, 33, 95, 2, 8, 37, 91, 4, 50, 36, 86, 35, 76, 10, 79],
	#[6, 309],
	#[],
	#[],
	#[],
	#[],
	#[],
	#[],
	#[4, 316],
	#[],
	#[],
	#[],
	#[234, 351, 237, 356, 230, 348, 231, 355, 235, 350, 64, 352, 62, 353, 63, 349, 25, 354],
	#[],
	#[],
	#[238, 325, 227, 323, 239, 324, 65, 326],
	#[243, 338, 241, 337, 66, 336],
	#[240, 328, 24, 327],
	#[],
	#[],
	#[],
	#[104, 84, 103, 329, 99, 330, 102, 100, 4, 50, 10, 79],
	#[102, 127, 101, 333, 100, 332, 10, 79],
	#[25, 331],
	#[],
	#[104, 84, 102, 100, 103, 335, 10, 79, 4, 50],
	#[9, 334],
	#[],
	#[102, 127, 10, 79],
	#[],
	#[242, 339, 24, 340],
	#[],
	#[245, 342, 27, 341],
	#[],
	#[244, 345, 246, 344],
	#[25, 343],
	#[],
	#[9, 347],
	#[27, 346],
	#[],
	#[],
	#[],
	#[],
	#[4, 50, 204, 57, 203, 69, 236, 362, 201, 99, 200, 62, 199, 75, 197, 101, 194, 82, 192, 60, 191, 72, 195, 88, 146, 94, 145, 56, 144, 68, 140, 73, 139, 92, 130, 96, 129, 363, 141, 61, 142, 98, 131, 81, 104, 84, 103, 85, 143, 83, 102, 100, 53, 66, 52, 55, 50, 65, 42, 64, 41, 58, 40, 89, 39, 77, 38, 71, 37, 91, 36, 86, 35, 76, 34, 54, 33, 95, 10, 79],
	#[232, 359, 233, 358],
	#[],
	#[],
	#[],
	#[230, 357, 25, 354],
	#[],
	#[],
	#[234, 361, 237, 356, 235, 350, 62, 353, 64, 352, 63, 349],
	#[9, 360],
	#[],
	#[],
	#[104, 200, 4, 50, 206, 203, 205, 196, 138, 201, 137, 202, 136, 364],
	#[],
	#[],
	#[],
	#[],
	#[],
	#[],
	#[],
	#[104, 84, 103, 329, 102, 100, 99, 372, 10, 79, 4, 50],
	#[],
	#[],
	#[],
	#[],
	#[],
	#[],
	#[],
	#[],
	#[],
	#[]],
  action-function-table:
	 vector(idl-parser-action0,
		idl-parser-action1,
		idl-parser-action0,
		idl-parser-action0,
		idl-parser-action0,
		idl-parser-action0,
		idl-parser-action0,
		idl-parser-action0,
		idl-parser-action0,
		idl-parser-action9,
		idl-parser-action10,
		idl-parser-action11,
		idl-parser-action12,
		idl-parser-action13,
		idl-parser-action14,
		idl-parser-action15,
		idl-parser-action16,
		idl-parser-action17,
		idl-parser-action18,
		idl-parser-action19,
		idl-parser-action20,
		idl-parser-action21,
		idl-parser-action22,
		idl-parser-action22,
		idl-parser-action24,
		idl-parser-action25,
		idl-parser-action26,
		idl-parser-action27,
		idl-parser-action28,
		idl-parser-action29,
		idl-parser-action1,
		idl-parser-action27,
		idl-parser-action32,
		idl-parser-action33,
		idl-parser-action34,
		idl-parser-action35,
		idl-parser-action1,
		idl-parser-action0,
		idl-parser-action38,
		idl-parser-action39,
		idl-parser-action0,
		idl-parser-action0,
		idl-parser-action0,
		idl-parser-action0,
		idl-parser-action0,
		idl-parser-action0,
		idl-parser-action46,
		idl-parser-action47,
		idl-parser-action48,
		idl-parser-action49,
		idl-parser-action50,
		idl-parser-action51,
		idl-parser-action52,
		idl-parser-action53,
		idl-parser-action54,
		idl-parser-action55,
		idl-parser-action56,
		idl-parser-action57,
		idl-parser-action58,
		idl-parser-action59,
		idl-parser-action60,
		idl-parser-action61,
		idl-parser-action61,
		idl-parser-action61,
		idl-parser-action61,
		idl-parser-action61,
		idl-parser-action66,
		idl-parser-action67,
		idl-parser-action68,
		idl-parser-action66,
		idl-parser-action66,
		idl-parser-action66,
		idl-parser-action72,
		idl-parser-action66,
		idl-parser-action74,
		idl-parser-action66,
		idl-parser-action76,
		idl-parser-action66,
		idl-parser-action78,
		idl-parser-action79,
		idl-parser-action66,
		idl-parser-action81,
		idl-parser-action82,
		idl-parser-action66,
		idl-parser-action84,
		idl-parser-action85,
		idl-parser-action86,
		idl-parser-action66,
		idl-parser-action88,
		idl-parser-action89,
		idl-parser-action90,
		idl-parser-action91,
		idl-parser-action66,
		idl-parser-action93,
		idl-parser-action94,
		idl-parser-action94,
		idl-parser-action96,
		idl-parser-action94,
		idl-parser-action98,
		idl-parser-action99,
		idl-parser-action100,
		idl-parser-action101,
		idl-parser-action27,
		idl-parser-action66,
		idl-parser-action66,
		idl-parser-action66,
		idl-parser-action106,
		idl-parser-action107,
		idl-parser-action66,
		idl-parser-action66,
		idl-parser-action61,
		idl-parser-action66,
		idl-parser-action112,
		idl-parser-action66,
		idl-parser-action66,
		idl-parser-action66,
		idl-parser-action66,
		idl-parser-action66,
		idl-parser-action66,
		idl-parser-action66,
		idl-parser-action66,
		idl-parser-action66,
		idl-parser-action66,
		idl-parser-action66,
		idl-parser-action66,
		idl-parser-action46,
		idl-parser-action126,
		idl-parser-action48,
		idl-parser-action128,
		idl-parser-action66,
		idl-parser-action66,
		idl-parser-action131,
		idl-parser-action132,
		idl-parser-action66,
		idl-parser-action66,
		idl-parser-action135,
		idl-parser-action136,
		idl-parser-action137,
		idl-parser-action138,
		idl-parser-action139,
		idl-parser-action140,
		idl-parser-action141,
		idl-parser-action142,
		idl-parser-action143,
		idl-parser-action144,
		idl-parser-action145,
		idl-parser-action146,
		idl-parser-action147,
		idl-parser-action148,
		idl-parser-action149,
		idl-parser-action150,
		idl-parser-action151,
		idl-parser-action152,
		idl-parser-action153,
		idl-parser-action0,
		idl-parser-action1,
		idl-parser-action0,
		idl-parser-action157,
		idl-parser-action158,
		idl-parser-action159,
		idl-parser-action0,
		idl-parser-action161,
		idl-parser-action162,
		idl-parser-action163,
		idl-parser-action164,
		idl-parser-action165,
		idl-parser-action166,
		idl-parser-action167,
		idl-parser-action168,
		idl-parser-action169,
		idl-parser-action170,
		idl-parser-action61,
		idl-parser-action61,
		idl-parser-action61,
		idl-parser-action61,
		idl-parser-action66,
		idl-parser-action112,
		idl-parser-action0,
		idl-parser-action1,
		idl-parser-action0,
		idl-parser-action180,
		idl-parser-action181,
		idl-parser-action182,
		idl-parser-action0,
		idl-parser-action46,
		idl-parser-action48,
		idl-parser-action186,
		idl-parser-action187,
		idl-parser-action188,
		idl-parser-action189,
		idl-parser-action190,
		idl-parser-action191,
		idl-parser-action192,
		idl-parser-action193,
		idl-parser-action194,
		idl-parser-action195,
		idl-parser-action196,
		idl-parser-action197,
		idl-parser-action198,
		idl-parser-action199,
		idl-parser-action0,
		idl-parser-action201,
		idl-parser-action1,
		idl-parser-action0,
		idl-parser-action204,
		idl-parser-action205,
		idl-parser-action206,
		idl-parser-action207,
		idl-parser-action208,
		idl-parser-action209,
		idl-parser-action210,
		idl-parser-action211,
		idl-parser-action212,
		idl-parser-action213,
		idl-parser-action214,
		idl-parser-action215,
		idl-parser-action216,
		idl-parser-action212,
		idl-parser-action213,
		idl-parser-action219,
		idl-parser-action220,
		idl-parser-action216,
		idl-parser-action222,
		idl-parser-action223,
		idl-parser-action46,
		idl-parser-action48,
		idl-parser-action186,
		idl-parser-action227,
		idl-parser-action228,
		idl-parser-action229,
		idl-parser-action230,
		idl-parser-action231,
		idl-parser-action1,
		idl-parser-action233,
		idl-parser-action234,
		idl-parser-action235,
		idl-parser-action236,
		idl-parser-action237,
		idl-parser-action238,
		idl-parser-action239,
		idl-parser-action240,
		idl-parser-action241,
		idl-parser-action242,
		idl-parser-action243,
		idl-parser-action244,
		idl-parser-action245,
		idl-parser-action66,
		idl-parser-action247,
		idl-parser-action248,
		idl-parser-action249,
		idl-parser-action0,
		idl-parser-action93,
		idl-parser-action252,
		idl-parser-action253,
		idl-parser-action0,
		idl-parser-action1,
		idl-parser-action0,
		idl-parser-action257,
		idl-parser-action258,
		idl-parser-action259,
		idl-parser-action260,
		idl-parser-action261,
		idl-parser-action262,
		idl-parser-action263,
		idl-parser-action1,
		idl-parser-action265,
		idl-parser-action266,
		idl-parser-action267,
		idl-parser-action268,
		idl-parser-action269,
		idl-parser-action270,
		idl-parser-action271,
		idl-parser-action272,
		idl-parser-action46,
		idl-parser-action48,
		idl-parser-action186),
  action-nargs-table: #[2, 0, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 4, 1, 2, 2, 1, 1, 0, 2, 1, 1, 1, 1, 0, 2, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 0, 2, 1, 1, 2, 3, 1, 1, 1, 1, 1, 1, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 1, 3, 1, 3, 1, 3, 3, 1, 3, 3, 1, 3, 3, 3, 1, 2, 2, 2, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 0, 2, 1, 1, 1, 1, 1, 1, 1, 2, 1, 2, 3, 2, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 2, 0, 2, 1, 1, 3, 2, 1, 1, 1, 1, 1, 6, 1, 1, 1, 4, 1, 1, 1, 1, 1, 1, 2, 0, 2, 1, 1, 3, 2, 2, 0, 2, 1, 1, 1, 2, 3, 1, 2, 1, 1, 1, 1, 1, 5, 2, 2, 0, 2, 1, 3, 2, 2, 1, 3, 1, 1, 2, 1, 3, 1, 1, 2, 1, 3, 1, 1, 1, 2, 2, 0, 2, 1, 1, 3, 3, 2, 0, 1, 5, 1, 1, 1, 1, 1, 4, 3, 0, 1, 1, 1, 1, 1, 1, 1, 2, 3, 1, 1, 2, 0, 2, 2, 3, 1, 1, 1, 1, 1, 0, 4, 1, 1, 1, 1, 0, 4, 2, 2, 0, 2],
  action-nt-table: #[67, 68, 68, 69, 69, 69, 69, 69, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 83, 84, 85, 86, 87, 88, 89, 90, 90, 91, 92, 93, 94, 95, 95, 96, 97, 98, 98, 98, 98, 98, 98, 99, 100, 101, 101, 102, 103, 103, 103, 104, 105, 106, 107, 108, 109, 110, 111, 111, 111, 111, 111, 111, 111, 111, 112, 113, 114, 114, 115, 115, 116, 116, 117, 117, 117, 118, 118, 118, 119, 119, 119, 119, 120, 120, 120, 120, 121, 121, 121, 122, 122, 122, 122, 122, 122, 123, 124, 125, 125, 125, 125, 126, 127, 128, 128, 129, 129, 129, 130, 130, 130, 130, 130, 130, 131, 131, 131, 132, 132, 132, 133, 134, 135, 135, 136, 136, 137, 138, 139, 139, 140, 140, 140, 141, 141, 141, 142, 142, 142, 143, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 153, 154, 155, 156, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 167, 167, 167, 167, 167, 168, 169, 169, 170, 171, 172, 172, 173, 174, 174, 175, 176, 177, 178, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 189, 190, 191, 191, 192, 193, 194, 195, 196, 197, 198, 199, 199, 200, 201, 202, 203, 203, 204, 205, 206, 207, 208, 208, 209, 210, 211, 212, 213, 214, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 223, 223, 224, 225, 225, 226, 227, 228, 228, 229, 230, 231, 232, 232, 233, 234, 235, 236, 237, 237, 237, 238, 238, 239, 240, 241, 242, 243, 243, 244, 245, 246, 246]);

// eof
