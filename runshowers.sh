#!/bin/bash

export FLUPRO=/home/cosmicray/simulation/fluka
export HSIM=/home/cosmicray/simulation/corsika/run
export HDATA=/home/cosmicray/simulation/data/solar-neutrons

date
cp $HSIM/scicrt/atm-sn170904.dat $HSIM/
cp $HSIM/scicrt/sn-neutron.inp* $HSIM/
./corsika_nflat < sn-neutron.inp0 > output0.txt &
./corsika_nflat < sn-neutron.inp1 > output1.txt &
./corsika_nflat < sn-neutron.inp2 > output2.txt &
./corsika_nflat < sn-neutron.inp3 > output3.txt &
wait
date
mv output* $HDATA/
rm sn-neutron.inp*
rm atm-sn170904.dat
