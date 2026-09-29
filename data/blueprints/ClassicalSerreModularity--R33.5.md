# Classical Serre modularity — part R33.5: characteristic two, qualitative closure and the two routes — blueprint

This part covers stages R33.5 and R33.6 of ClassicalSerreModularity. After the first checkpoint:

| Stage | Coverage |
|---|---|
| R33.5 | `source_decomposed`: characteristic two and the qualitative theorem |
| R33.6 | `source_decomposed`: the strong form by the modern route, and the comparison |

The accepted restructuring RS-06 keeps R33.5 and narrows R33.6:
- **R33.6** compares the modern qualitative result with the existing definition and applies the conditional optimiser.
  It imports R27.4's dyadic completion to recover the one public theorem of R27.6, and it states exactly where the
  strong refinement stops being independent of Khare–Wintenberger.
- **What R33.6 must not claim:** that the modern qualitative proof alone supplies the scalar local dyadic optimisation.

**Sources:**
- **Dieulefait–Pacetti**, *A simplified proof of Serre's conjecture*, arXiv:2108.07577v2. Read the Introduction, the
  proof of Theorem 1.9 and §3; part R27.3 read the rest.
- **Khare–Wintenberger**, *Serre's modularity conjecture (I)*, the authors' preprint. Read §1.1.

Both files match the sha256 recorded for part R27.3. One node is carried from the reviewed decomposition, with its
excerpts re-selected; seven are new.

## Purpose

These layers close the modern route. R33.5 proves the qualitative theorem in every characteristic: every odd irreducible
ρ̄ : G_ℚ → GL₂(F̄_p) is modular. R33.6 turns it into the same strong statement that R27.6 proves, and records how the two
proofs differ. EllipticCurveModularity R29 can take either proof through a theorem parameter.

## Layer R33.5: characteristic two and qualitative closure (`TauCeti/NumberTheory/SerreConjecture/DieulefaitPacetti`)

- **`auxiliary-odd-prime-for-the-dyadic-system`.** A dyadic weight-2 system has, at every p > 3 outside its ramification,
  a member ρ_p that is crystalline of weight 2 at p. Its reduction is not bad dihedral: Lemma 1.14 at weight 2 would force
  p ∈ {3, 1}.
- **`dp-characteristic-two-closure`** (carried; planet "Characteristic two (Dieulefait–Pacetti §3)").
  - Solvable image: dihedral by KW I Lemma 6.1, then Rohrlich–Tunnell (GL2AutomorphicRepresentationsAndTransfer R17.6).
  - Non-solvable image: reduce at the auxiliary prime. A reducible reduction goes to Theorem 1.6; an irreducible one to
    the odd case (R33.4) and Theorem 1.4.
  - The stage uses the odd-characteristic theorem, never its own p = 2 conclusion.
- **`qualitative-serre-theorem`** (planet "The qualitative Serre theorem (all p)"). Odd p from R33.4, p = 2 from §3.
- **`globalisation-dependency-check`** (comparison). The route rests on:
  - lift existence (KW I Theorem 5.1, Gee, Snowden) and Dieulefait's compatible systems;
  - the lifting theorems (Kisin, Emerton, Paškūnas, Hu–Tan, Tung, Skinner–Wiles, Pan);
  - Langlands–Tunnell and Rohrlich–Tunnell;
  - the Tate, Serre and Schoof base cases;
  - from this roadmap, only R27.1's early package.

  It uses no node of R26 or R27.2–R27.6. Independence from Serre's conjecture itself also needs GL2ModularityLifting
  R32.6's audit of the globalisations inside the lifting theorems (the gap).

## Layer R33.6: classical weight-and-level refinement (`…/Comparison`)

- **`modern-and-classical-modularity-agree`** (comparison). DP's "ρ̄ ≅ ρ̄_{f,p} for an eigenform of weight ≥ 2" is
  equivalent to KW I's "arises from a newform", which is AlgebraicModularFormsAndSerreWeights R15.6's definition. The
  proof passes to newforms and uses Brauer–Nesbitt. There is no competing definition of modularity.
- **`strong-form-by-the-modern-route`** (planet "The strong form via the modern route"). R27.6's statement, from the
  qualitative theorem with:
  - R27.4/strong-form-by-minimal-lifts for p odd, and for p = 2 with k(ρ̄) = 2, including ρ̄|_{D₂} scalar;
  - SerreWeightAndLevelOptimisation R20.5–R20.6 for p = 2 with k(ρ̄) = 4.
- **`two-routes-comparison`** (comparison).
  - Qualitative existence: the classical route uses KW I's (L_r)/(W_r)/(D_r) induction and Khare's level-one
    theorem. The modern route uses neither, but shares KW I Theorem 5.1.
  - Refinement: the modern route stops being independent of KW exactly at ρ̄|_{D₂} scalar with non-dihedral
    projective image. There Buzzard's level lowering needs multiplicity one, which is not known, and KW I Theorem 1.2(2)
    supplies the level.
  - The dyadic weight-four optimisation is shared by both routes.
- **`elliptic-curve-export-via-either-route`.** The finite-flat weight-two export of R27.6, stated with the strong form as
  a hypothesis. Either proof then gives EllipticCurveModularity R29 its input.

## Mistakes found in the sources

None in the passages read for this part. (Part R27.3 recorded E3–E7 for KW I and DP.)

## Remaining work

- **The independence audit** belongs to GL2ModularityLifting R32.6 and is requested. Until it is done, the
  independence of the modern qualitative proof from Serre's conjecture is conditional.
- **Rohrlich–Tunnell** was not read: its statement comes from DP §3, and R17.6 owns it.

## Sources

- L. V. Dieulefait and A. M. Pacetti, *A simplified proof of Serre's conjecture*, arXiv:2108.07577v2 (2022).
- C. Khare and J.-P. Wintenberger, *Serre's modularity conjecture (I)*, Invent. Math. 178 (2009), 485–504 (the authors'
  preprint).
