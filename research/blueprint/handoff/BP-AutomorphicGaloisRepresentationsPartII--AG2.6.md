# Handoff: BP-AutomorphicGaloisRepresentationsPartII--AG2.6 (first checkpoint)

Agent: Claude Code, session cc-fb70e5. Refs #687.

- The packet is partial, with 9 nodes and 4 planets. The checker reports no errors and no warnings.
- RS-12 is still **needs_changes**, so the current structure is used.
- Part AG2.0 (#686, merged as #3919) supplies the normalisation dictionary that these nodes build on.

## What this checkpoint plans

Sources read:
- **BLGGT** (arXiv v4, SHA-256 c953df62…): §5.1 (compatible-system definitions, pp. 62–65) and Theorem 2.1.1(3)–(4) with
  the residual remarks (pp. 33–34).
- **ACC+** (Annals 197, printed page = PDF page + 896): §§2.2.5–2.3, Definition 2.3.6, and §7.1 Lemmas 7.1.1–7.1.10.

Every excerpt was matched against its page.

AG2.6:
- `extremely-weakly-compatible-system` (definition): ACC+'s very and extremely weak variants, as weakenings of R24.5's
  weakly compatible systems, which are imported and not re-planned.
- `compatible-system-of-pi` (construction, planet): R_π = (M_π, S_π, P_v, r_{l,ι}(π), expected HT), extremely weakly
  compatible, with independence of ι.
- `polarized-branch-de-rham-and-crystalline` (theorem, planet): BLGGT 2.1.1(3)–(4).
- `polarized-compatible-system-strictly-pure` (theorem): the system is totally odd polarized (with E2's corrected sign)
  and strictly pure of weight w + n − 1.
- `very-weak-compatibility-under-dgi` (theorem): ACC+ Lemmas 7.1.9–7.1.10.
- Carried from the decomposition: the coefficient-prime comparison. Its Hodge–Tate recipe is now transcribed.

AG2.7:
- `residual-representation-of-pi` (construction, planet): the field of realisation comes before the lattice, as the stage
  requires. Then Brauer–Nesbitt independence, the Frobenius polynomials, and the 𝒢_n extension.
- `hecke-maximal-ideal-of-galois-type` (definition): Galois type and non-Eisenstein maximal ideals, and m_π.
- Carried from the decomposition: decomposed genericity (planet), now with 7 API items and 4 unit tests.

## Source issues (new)

- **E3** (ACC+ (2.2.6), p. 922, checked on the page image): the last term of P_v is printed without (−1)^n. p. 938 has it
  right.
- **E4** (ACC+ (2.2.7), the definition of P̃_{v,σ}, and Lemma 2.2.13(2)): X^{2n−j} is missing, and X^{n−i} should be
  X^{2n−i}.

Both are misprints that affect nothing.

## Requests (new)

- PadicHodgeTheory R06.2 and R06.3.
- ArithmeticGaloisRepresentations R01.1: the field of realisation, lattices, and Brauer–Nesbitt.
- IntegralHeckeAndGaloisDeterminants IHG.3: the unramified Hecke algebra.
- EndoscopicTransferAndUnitaryTraceComparison ET.7.
- PotentialAutomorphyInfrastructure PA.1: ACC+ Theorem 4.5.1.

## Suggested Lean file

It imports Mathlib only and was compiled with `lake env lean` against Mathlib 082e2d3, with exit code 0. The only
warning is 1 `sorry`.
- `IsGenericEigenvalues` is defined, and its projective invariance is proved.
- Checked examples: the three genericity tests, the Hodge–Tate arithmetic of the determinant and of the purity weight,
  and the n = 1 sign behind E3.

## What remains (precisely)

- **AG2.6:**
  - the p-adic Hodge comparison applied to the geometric construction, through Chenevier–Harris's deformation and
    descent (their §§2–3);
  - Caraiani's log-crystalline weight spectral sequence (l = p paper, §§2–5);
  - the Fontaine–Laffaille/ordinary consumers, which belong to PotentialAutomorphyInfrastructure.
- **AG2.7:**
  - the typed export packages, which are packaging only and so are recorded but not planned;
  - the "stronger decomposed-generic API", which the sources do not identify;
  - where ACC+ Chapters 4–6 consume decomposed genericity.
