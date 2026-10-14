import Mathlib.Init

/-!
# Source hypotheses for anticyclotomic nonvanishing

This file supplies suggested forms, not the definitive roadmap or an exhaustive
checklist. The mathematical specification is in the companion reader and the
HE.8/HE.8b targets it imports. Suggested declarations are goals, not proofs.

HE.8c is a source-hypothesis companion with no mathematical declarations.
Consequently this file introduces no data definitions, theorem signatures,
API lemmas, examples, or substitute arithmetic carriers. Elaborating it checks
only this file and its minimal library import; it checks no nonvanishing theorem.

The existing HE.8 owners include cmCharacterStratum and its four API items and
three tests; indefinite_cm_character_point; definite_cm_character_period;
cornut_vatsal_indefinite_nonvanishing (the legacy HE.8c-prefixed target ID has
HE.8 mathematical ownership); cornut_tower_trace_nontorsion;
bcgs_conditional_kolyvagin_nonvanishing; heegnerDivisibilityProfile and its
four API items and three tests; bcgs_conditional_refined_divisibility.

The existing HE.8b owners include bdp_function_convention_comparison;
rational/integral Heegner and Greenberg main-conjecture targets;
eisenstein_main_conjecture_adapter; and the split A/B branch applications.
Their signatures and tests are supplied by their own Suggested file, without
repetition here. The current compact-shape rule keeps missing arithmetic
carriers and hypotheses in the reader rather than manufacturing data here.

Compilation of this file cannot close the non-Archimedean dynamics, exact
analytic/BDP normalization, independent Eisenstein proof, or uniform
weak-torsion-bound gaps recorded in the companion packet.
-/
