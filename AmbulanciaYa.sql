PGDMP  -    +            	    |            AmbulanciasYa    16.4    16.4 '    7           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            8           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            9           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            :           1262    16398    AmbulanciasYa    DATABASE     �   CREATE DATABASE "AmbulanciasYa" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Argentina.1252';
    DROP DATABASE "AmbulanciasYa";
                postgres    false                        3079    16399 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false            ;           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            Z           1247    16411    estado    TYPE     >   CREATE TYPE public.estado AS ENUM (
    'Alta',
    'Baja'
);
    DROP TYPE public.estado;
       public          postgres    false            ]           1247    16416 
   tipoestado    TYPE     B   CREATE TYPE public.tipoestado AS ENUM (
    'Alta',
    'Baja'
);
    DROP TYPE public.tipoestado;
       public          postgres    false            �            1259    16421 	   Accidente    TABLE     �  CREATE TABLE public."Accidente" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    direccion text NOT NULL,
    descripcion text NOT NULL,
    "requiereTraslado" boolean NOT NULL,
    fecha date NOT NULL,
    hora time without time zone NOT NULL,
    "ambulanciaID" uuid NOT NULL,
    "reporteID" uuid NOT NULL,
    "hospitalID" uuid NOT NULL,
    "reportanteID" uuid NOT NULL,
    "pacienteID" uuid NOT NULL
);
    DROP TABLE public."Accidente";
       public         heap    postgres    false    2            �            1259    16427 
   Ambulancia    TABLE     P  CREATE TABLE public."Ambulancia" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    patente text NOT NULL,
    inventario boolean NOT NULL,
    vtv boolean NOT NULL,
    seguro boolean NOT NULL,
    "paramedicoID" uuid NOT NULL,
    estado public.tipoestado DEFAULT 'Alta'::public.tipoestado,
    "choferID" uuid NOT NULL
);
     DROP TABLE public."Ambulancia";
       public         heap    postgres    false    2    861    861            �            1259    16434    Chofer    TABLE     �   CREATE TABLE public."Chofer" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "nombreCompleto" text NOT NULL,
    dni text NOT NULL,
    estado public.tipoestado DEFAULT 'Alta'::public.tipoestado
);
    DROP TABLE public."Chofer";
       public         heap    postgres    false    2    861    861            �            1259    16441    Hospital    TABLE     �   CREATE TABLE public."Hospital" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    nombre text NOT NULL,
    direccion text NOT NULL
);
    DROP TABLE public."Hospital";
       public         heap    postgres    false    2            �            1259    16447    Paciente    TABLE     �   CREATE TABLE public."Paciente" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "nombreCompleto" text NOT NULL,
    telefono text NOT NULL
);
    DROP TABLE public."Paciente";
       public         heap    postgres    false    2            �            1259    16453 
   Paramedico    TABLE     �   CREATE TABLE public."Paramedico" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "nombreCompleto" text NOT NULL,
    dni text NOT NULL,
    estado public.tipoestado DEFAULT 'Alta'::public.tipoestado
);
     DROP TABLE public."Paramedico";
       public         heap    postgres    false    2    861    861            �            1259    16460 
   Reportante    TABLE     �   CREATE TABLE public."Reportante" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "nombreCompleto" text,
    telefono text
);
     DROP TABLE public."Reportante";
       public         heap    postgres    false    2            �            1259    16466    Reporte    TABLE     �   CREATE TABLE public."Reporte" (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    descripcion text NOT NULL,
    fecha date NOT NULL,
    hora time without time zone NOT NULL
);
    DROP TABLE public."Reporte";
       public         heap    postgres    false    2            -          0    16421 	   Accidente 
   TABLE DATA           �   COPY public."Accidente" (id, direccion, descripcion, "requiereTraslado", fecha, hora, "ambulanciaID", "reporteID", "hospitalID", "reportanteID", "pacienteID") FROM stdin;
    public          postgres    false    216   0       .          0    16427 
   Ambulancia 
   TABLE DATA           p   COPY public."Ambulancia" (id, patente, inventario, vtv, seguro, "paramedicoID", estado, "choferID") FROM stdin;
    public          postgres    false    217   �3       /          0    16434    Chofer 
   TABLE DATA           E   COPY public."Chofer" (id, "nombreCompleto", dni, estado) FROM stdin;
    public          postgres    false    218   j5       0          0    16441    Hospital 
   TABLE DATA           ;   COPY public."Hospital" (id, nombre, direccion) FROM stdin;
    public          postgres    false    219   q6       1          0    16447    Paciente 
   TABLE DATA           D   COPY public."Paciente" (id, "nombreCompleto", telefono) FROM stdin;
    public          postgres    false    220   �7       2          0    16453 
   Paramedico 
   TABLE DATA           I   COPY public."Paramedico" (id, "nombreCompleto", dni, estado) FROM stdin;
    public          postgres    false    221   �8       3          0    16460 
   Reportante 
   TABLE DATA           F   COPY public."Reportante" (id, "nombreCompleto", telefono) FROM stdin;
    public          postgres    false    222   �9       4          0    16466    Reporte 
   TABLE DATA           A   COPY public."Reporte" (id, descripcion, fecha, hora) FROM stdin;
    public          postgres    false    223   �:       �           2606    16473    Accidente Accidente_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Accidente"
    ADD CONSTRAINT "Accidente_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."Accidente" DROP CONSTRAINT "Accidente_pkey";
       public            postgres    false    216            �           2606    16475    Ambulancia Ambulancia_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Ambulancia"
    ADD CONSTRAINT "Ambulancia_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Ambulancia" DROP CONSTRAINT "Ambulancia_pkey";
       public            postgres    false    217            �           2606    16477    Chofer Chofer_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Chofer"
    ADD CONSTRAINT "Chofer_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Chofer" DROP CONSTRAINT "Chofer_pkey";
       public            postgres    false    218            �           2606    16479    Hospital Hospital_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Hospital"
    ADD CONSTRAINT "Hospital_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Hospital" DROP CONSTRAINT "Hospital_pkey";
       public            postgres    false    219            �           2606    16481    Paciente Paciente_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Paciente"
    ADD CONSTRAINT "Paciente_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Paciente" DROP CONSTRAINT "Paciente_pkey";
       public            postgres    false    220            �           2606    16483    Paramedico Paramedico_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Paramedico"
    ADD CONSTRAINT "Paramedico_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Paramedico" DROP CONSTRAINT "Paramedico_pkey";
       public            postgres    false    221            �           2606    16485    Reportante Reportante_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Reportante"
    ADD CONSTRAINT "Reportante_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."Reportante" DROP CONSTRAINT "Reportante_pkey";
       public            postgres    false    222            �           2606    16487    Reporte Reporte_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Reporte"
    ADD CONSTRAINT "Reporte_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Reporte" DROP CONSTRAINT "Reporte_pkey";
       public            postgres    false    223            �           2606    16488 %   Accidente Accidente_ambulanciaID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Accidente"
    ADD CONSTRAINT "Accidente_ambulanciaID_fkey" FOREIGN KEY ("ambulanciaID") REFERENCES public."Ambulancia"(id) NOT VALID;
 S   ALTER TABLE ONLY public."Accidente" DROP CONSTRAINT "Accidente_ambulanciaID_fkey";
       public          postgres    false    216    217    4746            �           2606    16493 #   Accidente Accidente_hospitalID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Accidente"
    ADD CONSTRAINT "Accidente_hospitalID_fkey" FOREIGN KEY ("hospitalID") REFERENCES public."Hospital"(id) NOT VALID;
 Q   ALTER TABLE ONLY public."Accidente" DROP CONSTRAINT "Accidente_hospitalID_fkey";
       public          postgres    false    219    4750    216            �           2606    16498 #   Accidente Accidente_pacienteID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Accidente"
    ADD CONSTRAINT "Accidente_pacienteID_fkey" FOREIGN KEY ("pacienteID") REFERENCES public."Paciente"(id) NOT VALID;
 Q   ALTER TABLE ONLY public."Accidente" DROP CONSTRAINT "Accidente_pacienteID_fkey";
       public          postgres    false    4752    216    220            �           2606    16503 %   Accidente Accidente_reportanteID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Accidente"
    ADD CONSTRAINT "Accidente_reportanteID_fkey" FOREIGN KEY ("reportanteID") REFERENCES public."Reportante"(id) NOT VALID;
 S   ALTER TABLE ONLY public."Accidente" DROP CONSTRAINT "Accidente_reportanteID_fkey";
       public          postgres    false    222    216    4756            �           2606    16508 "   Accidente Accidente_reporteID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Accidente"
    ADD CONSTRAINT "Accidente_reporteID_fkey" FOREIGN KEY ("reporteID") REFERENCES public."Reporte"(id) NOT VALID;
 P   ALTER TABLE ONLY public."Accidente" DROP CONSTRAINT "Accidente_reporteID_fkey";
       public          postgres    false    4758    216    223            �           2606    16513 #   Ambulancia Ambulancia_choferID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Ambulancia"
    ADD CONSTRAINT "Ambulancia_choferID_fkey" FOREIGN KEY ("choferID") REFERENCES public."Chofer"(id) NOT VALID;
 Q   ALTER TABLE ONLY public."Ambulancia" DROP CONSTRAINT "Ambulancia_choferID_fkey";
       public          postgres    false    217    4748    218            �           2606    16518 '   Ambulancia Ambulancia_paramedicoID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Ambulancia"
    ADD CONSTRAINT "Ambulancia_paramedicoID_fkey" FOREIGN KEY ("paramedicoID") REFERENCES public."Paramedico"(id) NOT VALID;
 U   ALTER TABLE ONLY public."Ambulancia" DROP CONSTRAINT "Ambulancia_paramedicoID_fkey";
       public          postgres    false    4754    217    221            -   �  x�e�=�7�c�)� ��Il&��ȁ˱����3���"gJ�bFK[e��:$�~��x����A����Z�b�,��{�?l.��n�w�m��m?~���m{�_�>\��m��y�+Wۦ�<����|���=$L"��S�'�P��L�LeV�}'Ü;˪+,��Pp���u�hE q�cp�W�����U�/�A�I�������l1rG`���B	a��&N��5�%C8���`��`��$+��~���J���wT�� �25��,|��ٶ�ϗ�>e�7�~5���~�|��Y�応R@~*tp�ML�X��;�
}����i*����P��]�	:cS�@5�h(�	�@�k��a��\��K3�w�Hƨ�+���`-e��CVp����Ǣ��ځHV.%�<Ղ�*6�1����� �{Li�㛹~�2�˖����v���y�_���	2�؟�wLE��бE(�\w�>��f�Fv�{h6�9���8Pg��t%�p5i�&�&�f�a��L�Uu&#4��qW�<��I|*=H��2%[!�a�n`��5�����;+/+f��唙���J����˲��G6��_�a׻��[N�U�y$�3��e{�|�����q�U�m��y�hnF��U��_��CL��8|����Q�Z���^�D
�u� ���[$ub��iӒ�{�X{��=���t�DGDE��$De�kV=b9ٍ�0��l��r�DQS%G�[�t�0�=�C��_�2O�c�a�ʾOVq�22T�.�y�^_c��-{���޺��������ɯ��y{�u�������kL)��o�q�� ���فƺ�T������StL_B�riuT���Zp6�9@ӜGn���b9�2�wԹ�F�����p�Y)gY�G��E��K���b��Z�y�֔�O��p:���ܣ5      .   �  x�-�9��1�c�w�%	��3�}������˴�K	��Z����Tal6��OET��(/�o�c���+�4�a����hC��&���ߛ1���a��0#hWq�sb͵��g��V6��Erܩ}*�EZ��8�� [;!-�]]�	��L$�)>W�HM<������`@���>h�_t�@�4��}�N�K=&�O���Z�|��#�������UI�1;GFy�?^�!��W��R�ԖUt'Z��kz�jK`-zxD@#�k(�7*_�}��?�]������8��t/O����p�.��s��Wr2ޝٵ�}�H���*�!��j9�h���I�8:�?����`��企�(F; %3���Z�Á�;u6��gv�	`V�l�d�~��������      /   �   x�-�1N�0�:9E.0��8O�B	���i��!�,
l��ْb+���a�t��o�Z� )�>��"ID՚S.�{8�<<�?��;�Џ�bw����8��G���bQ�`Zb_�J�$�z���8���Ԍ���U$#ؒxK)ږ���Va���2���X��o���c	�
O� �2��$3QŘ��,������{�nmK;cC�x�����FN�)�6�����p�˼^�Ґ�p�z�����_      0     x�]�=N�@���>�^`�]E�����,�!��@��] �W>��Z����] pZ�$nI̭�����W����gZ~�V7�2��ږI��>�6".�+���.%g\+�/�m_�سT�q8ʬX��rW��"F��	��@��
	�"�z'Ӱ|,�j'ө,ߣ�և�f�D�M����k�}#`)MZ[#x1�c�~�
�\mO�[~&3��zs����5g����0e�@(֊��I��2z����P{���*^w}��u�ˎ�y      1   �   x�-�1N1�zr���Q�3��f�V��8�#hfQ�6܆�b+�0#��r�߷m��*+�P2��H���Q�����~�����;��BqM�|c�<�X������"�B~:^�~��Q�m��0 �D��Q�#qȉ+�%J32㐧��M�z�����}�!�0��9�JQ��B������DBu:��|��=?�i�t5zƄ�U +Ȁ����>"�L��E���e����ݸ� ������\      2   �   x�=�MJA�u�)�%�S��*��&�tS�Ub:ƅw�)r12������Pm��1@],���aSU�k�]iޯ�o��E~U����F��4q����5Ł�����|N%R��+�,�緵�Q�*o�]8��o�}3�~�)�N>i�Y$�z��%�yY�l���2Yd�dt��PaH���"�u~�ޥ����q-H	cT����R9�!�.��('�?��������4MaY�      3   �   x�-�;N1�x|��@#��ݝ#��&���VZv��p'�=�\�*�z�� �A���+(F�i4ߔ��ˣ^��|x�o��s�1B�)�l��X�<��$�dsJi�&���m9>�8�VH� I�i�cP�B)7M=�_^���.'�������&&.����@��n�L> ��^�Xҿ&�B�B
r����&IK]^�ڷ���|=m��j+01�wιo@-L�      4   R  x�E�Kj$1���S�
~���5a���F���P���:w�s����F�O�+�	���
8Krp&��s�2�*�D��v��M.(������W��,{FZ��B�٪Y�K�j���G�k &�)�C����o��'��I.�6m�Q8��0�s������Ҭ�)�.��K 6%��	!WM0L�<U����˱K�+n��+�+�9�8�.i_�S��!�B��}Ib$o�6����92�<���)�3S?፷�뿿�~�F�,,�������pB��?�zG���Q�\ }2#�)O��D!����ϝ�'�7�/ؿ/�ez`�0z�_�ק���><�h     