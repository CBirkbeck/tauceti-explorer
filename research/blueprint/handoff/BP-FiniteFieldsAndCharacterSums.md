# Handoff — BP-FiniteFieldsAndCharacterSums

Job `BP-FiniteFieldsAndCharacterSums`, issue #1029. Agent: Claude Code, session `cc-2aeb03`, 25 September 2026.

- **First pass.** No packet or reviewed decomposition existed.
- **Binding restructuring:** RS-03 (accepted), followed as written:
  - FF.0, FF.1, FF.3 and FF.5 are narrowed to their `keeps`, and FF.2 and FF.4 are kept.
  - FF.1 is the single owner of the character and Gauss–Jacobi normalisations.
  - FF.2 is the single owner of the Weil–Deligne estimate handoff.

## Deliverables

- **Packet:** `research/blueprint/packets/FiniteFieldsAndCharacterSums.json`.
  - 354 nodes: 179 theorems, 71 lemmas, 59 definitions, 42 constructions, 2 comparisons and 1 application.
  - 562 API items, 374 unit tests and 32 planets (at most six per layer).
  - 457 pinned baseline declarations and 32 sources.
  - 34 source issues, 6 gaps, 31 requests and 5 structural proposals.
  - `python3 scripts/check_blueprint.py … --index <pinned index>` reports 0 errors and 0 warnings.
- **Roadmap document:** `research/blueprint/readmes/FiniteFieldsAndCharacterSums.md`, one section per layer, which agrees
  with the packet.
- **Suggested Lean file:** `research/blueprint/suggested/FiniteFieldsAndCharacterSums.lean`, 6,560 lines in namespace
  `TauCeti.FiniteFieldSums`.
  - It **compiles**: `lake env lean` at Mathlib `082e2d3` gives only `declaration uses 'sorry'` warnings.
  - Every API item and unit test occurs under its packet name.
  - FF.3's factorisation certificates use FF.0's `RabinCertificate f` directly, not a local copy.
  - The ℓ-adic objects of FF.2 on open subsets of the line are stated through their Galois characters. The cohomological
    statements are listed in the file, not declared with placeholders.

## What is closed and what remains

| Layer | Status | Nodes | What remains |
|---|---|---|---|
| FF.0 | source decomposed | 11 | nothing |
| FF.1 | partial | 42 | the proof of the Hasse–Davenport product relation (no public proof read; gap); the AC.0 request for the general finite-abelian Fourier transform |
| FF.2 | partial | 89 | the Grothendieck–Ogg–Shafarevich formula (no owner; gap and structural proposal); Weil I Lemma 8.5's compactification and local constancy (gap); the uniform Lang–Weil constant (Katz's Betti bound; gap); Ekedahl's geometric Chebotarev variant; *Sommes trig.* §§4–7 (hyper-Kloosterman sums); FKMS §5 quasi-orthogonality |
| FF.3 | source decomposed | 104 | nothing; the cost model is requested from ComputationalNumberTheory CN.0 |
| FF.4 | partial | 91 | units of GR(2^n, r) for r ≥ 2 (gap); Katz's Soto-Andrade estimate for the Terras graphs (gap); Wu–Liu §§3, 5–6; Goresky–Klapper §§13.3–13.4 and 14.1–14.7; the Hermitian-curve code as an example |
| FF.5 | source decomposed | 17 | nothing |

**Acceptance conditions:**

- **FF.0.** Field isomorphisms come with their inverses, and the Frobenius exponents and trace targets are explicit.
- **FF.1.** The trivial-character cases are separate nodes, with Mathlib's zero convention compared with the classical one.
- **FF.2.** Artin–Schreier-trivial phases and multiplicative perfect powers are degenerate cases with their exact values,
  not given a false square-root bound.
- **FF.3.** Factorisations carry checked certificates (the product identity plus a Rabin certificate per factor). Point
  counts use the trace convention a_q = q + 1 − #E(F_q), with the Hasse bound imported from Tau Ceti EllipticCurves layer 3.
- **FF.4.** Reed–Solomon and BCH codes carry their field-size and length restrictions (n ≤ q), with encoding maps,
  dimension and distance.
- **FF.5.** Consumers instantiate exact constants, and no node infers computational hardness from correctness.

**Requests answered:**

- **ClassicalArithmeticCompletion CA.1** requested the character conventions. They are `FF.1/trivial-character-conventions`,
  `FF.1/gauss-sum-transport` (with the shift identity) and `FF.1/canonical-additive-character`.
- **Stickelberger.** FF.1 also plans `FF.1/stickelberger-congruence` and `FF.1/stickelberger-relation`. The
  ClassicalArithmeticCompletion packet records "Stickelberger's theorem … has no owner" as a gap for CA.1's Eisenstein
  reciprocity. That gap can now point to these nodes. This session wrote that packet, and a follow-up there should re-point
  it.

**Sources beyond the roadmap document.** The accepted source routes of two paper extractions name these layers. Their
items are covered:

- **Bary-Soroker–Koukoulopoulos–Kozma** (Invent. Math. 2023), route 3: FF.1 (the Fourier analysis on 𝔽_p((1/T)), planned
  once), and FF.3 (the counts of irreducible polynomials);
- **Browning–Sawin** (Ann. of Math. 2020), route 2: FF.2 (the Artin–Schreier sheaf, vanishing by translation, Lang–Weil,
  and the Fourier–Deligne input).

## Merge decisions

- **Rabin's criterion and certificate** are FF.0's (`FF.0/rabin-irreducibility-criterion`,
  `FF.0/rabin-irreducibility-certificate`). FF.0's certified presentations need them, and they rest only on Mathlib. FF.3
  imports them.
- **The monic polynomials of a given degree** (`FF.2/monic-polynomials-of-degree`) move from FF.3 to FF.2, because FF.2's
  L-series of functions on monic polynomials uses them and FF.2 precedes FF.3.
- **Duplicate sources merged:** Shoup (`SHOUP.V2`, the id the ClassicalArithmeticCompletion packet uses), Kowalski's
  elementary notes, and Bary-Soroker–Koukoulopoulos–Kozma.

## Requests made (31)

- **Tau Ceti:**
  - AlgebraicCurves (7): Artin–Schreier covers, constant field extensions, affine models, the function-field and curve
    dictionary, divisors and the genus, Weil differentials with Riemann–Roch, and residues;
  - AlgebraicCodingTheory (2);
  - EllipticCurves (2): layer 3's Hasse bound and Frobenius, and #E[ℓ] = ℓ²;
  - LocalFieldsRamification (1).
- **SchemeAndStackFoundations:** SF.0, SF.1 and SF.2 (three).
- **EtaleDualityAndPerverseSheaves EDC.2** (two), including the Grothendieck–Ogg–Shafarevich formula, for which no stage
  exists.
- **WeilConjectures:** WC.0, WC.3 and WC.5.
- **DeligneWeightsAndPurity:** DWP.0, DWP.6 and DWP.7.
- **ComputationalNumberTheory:** CN.0 (the cost and randomness model; executable presentations) and CN.5 (the certificate
  schema).
- **AdditiveCombinatorics AC.0.**
- **FunctionFieldArithmetic FA.5.**
- **ArithmeticGaloisRepresentations R01.3.**

## For the orchestrator

1. **Structural proposals:**
   - An owner for the Grothendieck–Ogg–Shafarevich formula.
   - Sub-layers for FF.1, FF.2 and FF.4.
   - The overlap with DrinfeldModulesAndTModules DM.0, which the audit flags: it constructs additive polynomials as the Ore
     ring L{τ} again. FF.4 plans the finite-field theory and DM.0 should import it.
2. **Source mistakes (34).** Among them:
   - errors in stated results of Goresky–Klapper's *Algebraic Shift Register Sequences* (Galois subrings, cyclic subgroups,
     autocorrelation values, decimation);
   - in a public permutation-polynomial survey, an error in a stated result (E504) and one in a proof (E513);
   - Kowalski's notes print the discriminant of X³ + aX + b wrongly (E601);
   - E307: the conductor formula in Fouvry–Kowalski–Michel–Sawin's applied ℓ-adic notes.
3. **Retired supplier.** None: this roadmap's inputs do not name a retired roadmap.

## Sources

The pass read 32 free sources, with URLs, sections and SHA-256 in the packet. Among them:

- Shoup v2;
- Kowalski's elementary exponential-sums notes;
- Deligne's *Sommes trigonométriques* (§§1–3);
- Fouvry–Kowalski–Michel–Sawin, *Lectures on applied ℓ-adic cohomology*;
- Keith Conrad's handouts;
- Sutherland's MIT 18.783 notes;
- Milne's ANT notes;
- Guruswami–Rudra–Sudan, *Essential Coding Theory*;
- Goresky–Klapper;
- public permutation-polynomial and AG-code notes;
- the Bary-Soroker–Koukoulopoulos–Kozma and Browning–Sawin papers.

**Missing:** SGA 4½ beyond §§1–3 of *Sommes trig.*, Lidl–Niederreiter, Iwaniec–Kowalski, and Ekedahl (1990).
