  # IRPF - Programa de Declaração do Imposto sobre a Renda de Pessoa Física

Container Docker do programa que os brasileiros mais gostam de instalar todo ano.

## Instruções:

**Opção 1:** Execute manualmente:

```
docker run -it --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/ProgramasRFB:/home/irpf/ProgramasRFB skarllot/irpf
```

Ou, em sistemas protegidos com SELinux, execute:

```
docker run -it --rm --security-opt label=type:container_runtime_t -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/ProgramasRFB:/home/irpf/ProgramasRFB skarllot/irpf
```

