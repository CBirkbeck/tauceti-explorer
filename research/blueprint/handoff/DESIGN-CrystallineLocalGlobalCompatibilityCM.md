# DESIGN-CrystallineLocalGlobalCompatibilityCM

Worker: Codex — codex-YUlWGm. Issue: #6897. Branch: codex-YUlWGm-crystalline-cm.
This run claims and submits this one job only.

## Completed planning pass

The five deliverables contain the new roadmap definition, complete target-level packet,
reader document, suggested Lean file and this note. The accepted split direction is
PotentialAutomorphyInfrastructure Part II for Caraiani–Newton §§2–5. No other roadmap,
application code, atlas data or queue file was changed.

Counts: 96 nodes (19 definitions, 14 constructions, 63 theorems), 99 API items,
99 planned unit tests, 36 planets, nine verified baseline declarations, 22 supplier
requests, 35 gaps and 14 source findings. Every implementation status is unchecked.
All stages CL.0–CL.9 are **planned**, none is closed. The packet is **complete** as a
planning pass under PROTOCOL §0; this is not a closed formalisation.

All 84 routed source items have a routing entry. Theorem 1.3 uses the full 4.2.15 node;
the generic tensor identity 2.3.15 is requested from SR.2. The other 82 are owned
nodes; 14 additional carriers separate the objects needed by their proofs. The exact
CN 5.3.2–4 component inputs are imported, with an ownership reconciliation preserving
LocalGaloisDeformationRings as their owner. The elliptic-curve, modular-curve,
residual-modularity and Jacquet–Langlands applications remain with the sibling.

## Verification

- `python3 scripts/check_blueprint.py research/blueprint/packets/CrystallineLocalGlobalCompatibilityCM.json`
  reports zero errors and zero warnings against the available baseline index.
- Every source excerpt is a literal substring of the recorded CN/AKT PDF text after
  whitespace normalization and removal of nonprinting PDF control glyphs, as recorded
  in each source's excerptPolicy, and has at most 300 characters. The graph is acyclic;
  all 84 item ids route once. API/test names match the reader and suggested-file index.
- Only the five authorized paths are present in the job diff. No private absolute
  paths, papers, extracted texts or scratch files are included.
- The final `lean-check` run succeeded, with 31 warnings, all `declaration uses sorry`.
  Memory available exceeded 100 GB. No Lean server or Lake build/update/cache command
  was started. Nothing remains running in the background.
- The shared build has Mathlib exactly at 082e2d37e8b0463410cdb532e111cd43d5a66174.
  Its Tau Ceti working HEAD is cf386627e9176a3827c1a5fe804989fd94a4d216, rather than
  the required f790474821cf4256814db967cb154e7af3d0c369. Tau Ceti citations were read
  directly at f790474, and the suggested file imports only Mathlib. The check therefore
  validates the Mathlib-only prototype at its exact pin; it is not a Tau Ceti import
  check at f790474.

The suggested file elaborates four genuine algebraic cores (block exchange, positive
block exponents, the integral block subgroup and scalar rescaling), their 12 API
lemmas and 12 tests, plus the numerical degree bound and adic subquotient signature.
Missing arithmetic signatures are **indexed omissions**, with each proposed name,
statement and source. They are not encoded as assumed propositions. The ten prototype
gaps specify the absent types and include the missing arithmetic specialization of
the elaborated CL.0 cores. Compilation does not establish the arithmetic endpoints.

## Sources and library boundary

Read CN arXiv:2301.10509v3 (27 March 2025), §§2–5 and the routed introduction endpoints;
source TeX resolves bars and reversed weight tuples. Read the invoked AKT
arXiv:1910.12986v2 (2 September 2022, title page 5 September) statements and proofs,
including the A.5/A.6 finite-image/Taylor–Wiles input, A.7 interface, A.14 preparation,
PGL₂ complexes and 5.10 rational range. Full source hashes and read-section lists are
in the packet. The AKT journal text has not been collated: use the arXiv locators.

Read both complete upstream LieGroups and ReductiveGroups documents, the accepted
split and full paper route, reviewed parent/supplier audit, relevant atlas stage
statements and exact supplier nodes. The precise remaining source/supplier questions
are in requests and gaps; this note does not claim every secondary source was read.

The nine baseline declarations were read at the pins, including their assumptions:
DerivedCategory; Representation; Fin.revPerm; finAddFlip; the finite-module Fitting
complement; AlgHom.range and mem_range; Ideal.exists_pow_inf_eq_pow_smul; and
TauCeti.ArtinRees.exists_controlled_lift. The latter namespace was checked in the
actual pinned file. General discrete group cohomology and rank-one GL₂ Bruhat results
are insufficient for the continuous and general local-topological uses here.

## Mathematical corrections to retain

E1–E3, E6–E8, E10–E16 are inherited with originId and priorReview attribution to
PAPER-CARAIANI-NEWTON-23 / REV-PAPER-CARAIANI-NEWTON-23. This worker does not supply an
independent review of its own packet. E18 is the new missing general-coefficient
nonvanishing justification. Public correction search checked the latest arXiv listing
and the authors’ publication pages on 7 October 2026, with no linked correction found;
this is a limited search, not an exhaustive novelty claim.

The substantial error E12 was independently reproduced over F₇. Use the reader’s
explicit i,j,h matrices: enumerate Q₈ and its h/h² cosets, multiply by the cubic
character χ(h)=2, verify closure, det-image order three and the trace identity for
all determinant-nontrivial matrices. Invertible anticommuting i,j prove the determinant
kernel has no invariant line even over an algebraic closure. The counterexample
invalidates CN 5.6.5 as printed, not the automorphy conclusion.

The final lifting theorem carries **[F(ζ_p):F]≠3 or projective residual image not A₄**.
The preparation request must preserve the full residual-plus-cyclotomic field, not
just residual irreducibility. Retain this restriction until the missing exceptional
auxiliary-prime/preparation argument is proved. The p=3,5 exports remain unaffected.

For V_U at arbitrary algebraic weights, retain only the cohomological-dimension bound.
Exact nonzero degrees and deep formality are exported for trivial selected weights,
which suffice for degree shifting. The abelian Siegel radical has cohomology given by
continuous duals of exterior powers; no p>n² hypothesis or nonabelian formality is used.

## Where follow-up resumes

The packet’s coverage.remaining and request.neededBy lists are the authoritative
worklist. Resolve 22 exact exports at their owners: smooth monoid derived categories
and induction; continuous transfer/Koszul cochains; completed arithmetic towers;
integral Satake and dual Weyl theory; Hodge/WD and automorphic Galois interfaces;
Siegel retract; uniform arithmetic nilpotent Galois exports; derived Euler length and
two-system patching; character existence; solvable preparation/descent; general Bruhat
comparison; deep smooth-perfect comparison; and non-neat PGL₂ perfectness and rational
range. The general Koszul complex is requested once from DeformationAndDerivedPatchingAlgebra,
with its continuous comparison supplied by upstream ProfiniteCohomology.

Check in particular that the PGL₂ export gives q₀=l₀=[F⁺:Q], rather than the GL₂
cohomological range after dividing only by one split centre. The two-system data uses
finite derived Hecke images and nilpotent support, not a manufactured strict R-module
complex. Special **generic** points are required; a singular closed intersection point
cannot replace one. The nilpotence exponent is uniform in m, weight and level;
the deeper congruence level and m′ may depend on them.

CN 2.3.6 uses coefficient-injective smooth coinduction and locally constant functions
on P(L)w₀^P U₀. Its needed export is explicit in REQ-SMOOTH and REQ-INDUCTION; the
parent's Borel N(O)-acyclicity is not a sufficient substitute. CN 2.3.7 depends directly
on that open-cell acyclicity result, and the quotient's ordinary-cohomology vanishing
is included in REQ-CONTINUOUS.

After supplier types exist, replace the indexed Lean omissions by genuine signatures,
API lemmas and examples, collate the AKT journal passages, and resolve E18 or correct
that source assertion. Recovering the unrestricted E12 endpoint needs new mathematics.
Independent review should first check routing, exact supplier matches, weight and
Frobenius conventions, the deep-level comparison and those two source limitations.
No second job is claimed. Scratch is removed after the PR opens and submission checks
pass; everything needed to resume is retained in these deliverables.
