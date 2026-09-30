# Classical Serre modularity — part R33.5: characteristic two, qualitative closure and the two routes — blueprint

This part covers stages R33.5 and R33.6 of ClassicalSerreModularity. After the first checkpoint:

The fix for issue #5189 updates the dyadic system, exact supplier interfaces and
conditional export. The packet remains partial and awaits independent review of this revision.

| Stage | Coverage |
|---|---|
| R33.5 | `source_decomposed`: characteristic two and the qualitative theorem |
| R33.6 | `source_decomposed`: the strong form by the modern route, and the comparison |

The accepted restructuring RS-06 keeps R33.5 and narrows R33.6:
- **R33.6** compares the modern qualitative result with the existing definition and applies the conditional optimiser.
  Both proofs share KW I Theorem 5.1. The modern qualitative proof avoids KW’s induction; its strong refinement
  uses R27.4/strong-form-by-minimal-lifts for every odd p and every dyadic k=2 case. That refinement is
  indispensable only in the scalar dyadic non-dihedral case. R27.6 still owns the one public statement.
- **What R33.6 must not claim:** that the modern qualitative proof alone supplies the scalar local dyadic optimisation.

**Sources:**
- **Dieulefait–Pacetti**, *A simplified proof of Serre's conjecture*, arXiv:2108.07577v2. Read the Introduction, the
  proof of Theorem 1.9 and §3; part R27.3 read the rest.
- **Khare–Wintenberger**, *Serre's modularity conjecture (I)*, the authors' preprint. For this fix read pp.2–3 and 8–9.
- For this fix DP v2 pp.6–8 and 15 were re-read, including Theorem 1.9, Definition 1.10, Theorem 1.11, Remark 4 and Lemma 1.14.

Both files match the sha256 recorded for part R27.3. One node is carried from the reviewed decomposition, with its
excerpts re-selected; seven are new.

## Purpose

These layers close the modern route. R33.5 proves the qualitative theorem in every characteristic: every odd irreducible
ρ̄ : G_ℚ → GL₂(F̄_p) is modular. R33.6 turns it into the same strong statement that R27.6 proves, and records how the two
proofs differ. EllipticCurveModularity R29 can take either proof through a theorem parameter.

## Layer R33.5: characteristic two and qualitative closure (`TauCeti/NumberTheory/SerreConjecture/DieulefaitPacetti`)

- **`auxiliary-odd-prime-for-the-dyadic-system`.** Choose the system supplied by KW I Theorem 5.1(1)
  for dyadic k=2 or (2) for k=4, through `PotentialModularityAndCompatibleSystems:R24.5/kw-theorem-5-1-systems`.
  Its every characteristic-zero member is odd and irreducible by the theorem and the definitions on KW p.8.
  At an odd p>3 outside the ramification set, KW’s almost-strict clause for an unramified Weil–Deligne
  parameter gives crystallinity with weights {0,1}, even if the residual member is reducible. If the
  residual member is irreducible, Fontaine–Laffaille gives weight 2 and Lemma 1.14 would force a bad-dihedral
  prime to be 3 or 1. Primes outside the finite ramification set exist.
  This uses the particular KW system cited by DP Theorem 1.9, not an arbitrary system through a lift.
  The cross-characteristic Brauer–Nesbitt step and the extra determinant-character claim are removed;
  no rank-one companion request is added. Characteristic-zero irreducibility does not imply residual irreducibility.
- **`dp-characteristic-two-closure`** (carried; planet "Characteristic two (Dieulefait–Pacetti §3)").
  - Solvable image: dihedral by KW I Lemma 6.1, then Rohrlich–Tunnell (GL2AutomorphicRepresentationsAndTransfer R17.6).
  - Non-solvable image: reduce at the auxiliary prime. A reducible reduction goes to Theorem 1.6; an irreducible one to
    the odd case (R33.4) and Theorem 1.4.
  - Transfer uses `R24.6/linked-systems-modularity-transfer` (DP Remark 4): first construct Deligne’s
    system of a modular form, then compare representations at the same coefficient prime.
  - The stage uses the odd-characteristic theorem, never its own p = 2 conclusion.
- **`qualitative-serre-theorem`** (planet "The qualitative Serre theorem (all p)"). Odd p from R33.4, p = 2 from §3.
- **`globalisation-dependency-check`** (comparison). The route rests on:
  - lift existence (KW I Theorem 5.1, Gee, Snowden) and Dieulefait's compatible systems;
  - the lifting theorems (Kisin, Emerton, Paškūnas, Hu–Tan, Tung, Skinner–Wiles, Pan);
  - Langlands–Tunnell and Rohrlich–Tunnell;
  - the Tate, Serre and Schoof base cases;
  - from this roadmap, only R27.1's early package.

  It uses no node of R26 or R27.2–R27.6. Independence from Serre's conjecture itself also needs GL2ModularityLifting
  `R32.6/globalisation-dependency-audit`, which already exists as a partial, unreviewed supplier.
  It leaves Tung’s global Breuil–Mézard inputs ([CEG+16] patching, Emerton–Paškūnas faithfulness,
  BLGG13 Theorem A.4.1) and Gee’s Theorem 4.4.12 unaudited. Its R31.6/R20.6 requests and any still-unaudited
  lift/system inputs remain obligations. Exact node references do not certify those open requirements.

  The exact lift imports are `R24.3/theorem-5-1-part-1-minimal-crystalline` and
  `R24.3/theorem-5-1-part-2-weight-two`. System existence is `R24.5/kw-theorem-5-1-systems` or, for a
  given lift elsewhere in the qualitative route, `R24.5/dieulefait-families`. Modularity transfer is
  `R24.6/linked-systems-modularity-transfer`. The former request conflating existence and transfer is removed.

## Layer R33.6: classical weight-and-level refinement (`…/Comparison`)

- **`modern-and-classical-modularity-agree`** (comparison). DP's "ρ̄ ≅ ρ̄_{f,p} for an eigenform of weight ≥ 2" is
  equivalent to KW I's "arises from a newform", imported from
  `AlgebraicModularFormsAndSerreWeights:R15.6/s-type-arises-from-and-modular` with its coefficient/embedding conventions and N,k,ε. The
  proof passes to newforms and uses Brauer–Nesbitt. There is no competing definition of modularity.
- **`strong-form-by-the-modern-route`** (planet "The strong form via the modern route"). R27.6's statement, from the
  qualitative theorem with:
  - R27.4/strong-form-by-minimal-lifts for p odd, and for p = 2 with k(ρ̄) = 2, including ρ̄|_{D₂} scalar;
  - SerreWeightAndLevelOptimisation R20.5–R20.6 for p = 2 with k(ρ̄) = 4.
- **`two-routes-comparison`** — what each route uses from Khare–Wintenberger.
  - Qualitative existence: the classical route uses KW I's (L_r)/(W_r)/(D_r) induction and Khare's level-one
    theorem. The modern route uses neither, but shares KW I Theorem 5.1.
  - Refinement: both routes use R27.4/strong-form-by-minimal-lifts for odd p and p=2,k=2.
    That argument is indispensable only at ρ̄|_{D₂} scalar with non-dihedral projective image:
    Buzzard’s alternative level lowering needs multiplicity one, which is not known there.
    KW I Theorem 1.2(2) supplies the level through the shared refinement argument.
  - The dyadic weight-four optimisation is shared by both routes.
- **`elliptic-curve-export-via-either-route`.** For p≥5 and continuous odd absolutely irreducible ρ̄,
  finite at p with det ρ̄=χ̄_p, assume the strong conclusion **for this given ρ̄**: a newform of weight
  k(ρ̄), level N(ρ̄), character reducing to ε(ρ̄), and a chosen coefficient-place residual isomorphism.
  `R15.4/weight-two-iff-finite-flat-at-p` gives k=2; the determinant relation in the R15.6 definition gives ε=1.
  Respect the local supplier’s coefficient conditions: beyond F_p use Raynaud’s F-vector-space formulation.
  Apply the assumed strong conclusion, then `SerreWeightAndLevelOptimisation:R20.4/nebentypus-congruent-character`
  to replace the nebentypus by 1 at the same weight and level. Here p≥5 matters: a characteristic-zero
  character reducing to 1 need not itself be trivial. Retain the normalized newform, coefficient prime over p,
  residual isomorphism and good-prime trace congruences; N(ρ̄) is the residual Artin conductor.

  Instantiate the hypothesis with `R33.6/strong-form-by-the-modern-route`. Neither
  `R27.6/full-classical-serre-theorem` nor the unconditional `R27.6/finite-flat-weight-two-export` is a
  prerequisite. The modern export’s closure must reach no R26 or R27.2–R27.6 node except
  `R27.4/strong-form-by-minimal-lifts`. The same conditional argument is the shared API underlying the
  existing R27.6 export; coordination of that supplier’s reuse is a maintainer handoff, outside these files.
  No new StrongSerre definition is introduced. The comparison node may inspect both proofs, but the
  export does not import that comparison node’s classical-proof dependencies.

## Mistakes found in the sources

None in the passages read for this part. (Part R27.3 recorded E3–E9 for KW I and DP.)

## Remaining work

- **The remaining independence audit** is requested from `GL2ModularityLifting:R32.6/globalisation-dependency-audit`. Until it is done, the
  independence of the modern qualitative proof from Serre's conjecture is conditional.
- **Rohrlich–Tunnell** was not read: its statement comes from DP §3, and R17.6 owns it.
- **Dyadic weight four** remains requested from R20.6: the existing finer nodes do not supply the needed step.
- The exact supplier packets are partial and unreviewed at this snapshot; these imports are plans, not built theorems.
- AUDIT-31 marks R33.5/R33.6 not built. Mathlib has ModularForm/CuspForm and Tau Ceti has the newform carrier;
  the residual Galois and Serre-modularity interfaces remain absent. Suggested signatures remain comments;
  executable arithmetic examples are unchanged. This revision was not compiled because no existing build
  at the prescribed pin was available.

## Sources

- L. V. Dieulefait and A. M. Pacetti, *A simplified proof of Serre's conjecture*, arXiv:2108.07577v2 (2022).
- C. Khare and J.-P. Wintenberger, *Serre's modularity conjecture (I)*, Invent. Math. 178 (2009), 485–504 (the authors'
  preprint).
