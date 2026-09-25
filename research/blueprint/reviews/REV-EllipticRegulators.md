# Review: EllipticRegulators (Elliptic regulators, explicit K₂ classes and L-values), stages ER.1–ER.8

Job `REV-EllipticRegulators` (issue #393), by Claude Code, session `cc-442dc5`, 25 September 2026. The packet was written by Claude Code, session cc-7b31c4 (`BP-EllipticRegulators`, issue #716, PR #2888). I had no part in it. **Status: accepted**, after the corrections below, which were made in place. The packet stays `partial`: all eight stages are `partial`, and the open points are recorded as 12 gaps and 36 requests.

## What was checked

- **Sources.**
  - **Brunault's thesis**, arXiv:math/0602186v1: both the `/pdf` and `/e-print` endpoints return the same PDF, whose SHA-256 is the one the packet records (8fd73faba5db…); arXiv has no TeX source for it. The file has **155** pages, not 165; its title page reads "Étude de la valeur en s = 2 de la fonction L d'une courbe elliptique", and PDF page = printed page. The packet had read the introduction, §1 and §§2.1–2.2 only. The checkers read chapter 1, §§2.5–2.6 and **chapter 3, §§3.1–3.7** in full, with page images wherever the text layer drops overlines.
  - **Bloch, CRM Monograph 11**: the programme's supplied scan (9715a312…). The packet recorded it as unreadable ("no renderer"); it renders with `pdftoppm`, and Lectures 8–11 (printed pp. 61–93) were read from the images.
  - Added: Brunault, Bull. SMF 135 (2007) (the version of record of Théorèmes 4–5); Brunault, *Regulators of Siegel units and applications* (arXiv 1504.08127, J. Number Theory 2016); Zagier, *The Bloch–Wigner–Ramakrishnan polylogarithm function* (Math. Ann. 1990); Dokchitser–de Jeu–Zagier (arXiv math/0405040v2).
- **Checkers.** Three worked in parallel, each comparing locators and excerpts with the source pages, opening every cited declaration at Mathlib 082e2d3 and Tau Ceti f790474, reading every supplier stage and the accepted restructurings, and computing in mpmath and PARI/GP:

  | Checker | Scope |
  |---|---|
  | A | ER.1–ER.3 (12 nodes), the 7 baseline declarations, the library audit, the Lean file |
  | B | ER.4–ER.6 (12 nodes), Bloch's Lectures 10–11 |
  | C | ER.7–ER.8 (8 nodes), Brunault's chapter 3 and Merel's appendix, the packet-level fields, cycles |

- **What I checked myself.**
  - **Bloch's corrected L-value formula for 32a2** (τ = i, C = 4): (π/2)[D_q(i) + D_q(e^{2πi(3+2i)/4})] with q = e^{−2π}, the D_q as orbit sums of the Bloch–Wigner function (mpmath), is 0.917050635318654988643805524…, and PARI's L(E, 2) is 0.917050635318654988643805524…. The printed formula has the extra factor |μ_κ| = 4.
  - **Brunault's Corollaire 101 for 11a3**: from PARI's periods (τ = 1/2 + 0.22988i) and P ↦ 0.6, D_E(P) = 0.191193737084331695754…, L(E, 2)/(π D_E(P)) = 0.909090909… = 10/11, and D_E(2P)/D_E(P) = 3/2.
  - **Consistency of the normalisations** across the three checkers: A's r_Beil = 2 r_E = conj(R_q) at η*dz, B's r_E{f, g}(dz) = ½ conj(R_q((f)⋄(g))), and C's r({x, y})(ω) = −(5i/4)D_E(P) on 11a3 agree once J(q; ·) vanishes at real points.
  - **Ownership and cycles**: RS-06, RS-14 and RS-18, and the confirmed red-team findings RT-AREA-ktheory-2/7 and /24. A validator checks that every prerequisite resolves, that every stage prerequisite has a request, and that every request and gap names nodes. It also checks that the node graph is acyclic and follows the stage order, and that no path leads from a cross-roadmap prerequisite back to its ER stage or a later one. The paths it follows are node prerequisites, the atlas `requires` and the links of RS-06, RS-14 and RS-18. It finds no cycle.
- **Checks.**
  - `python3 scripts/check_blueprint.py --index <pinned declaration index> research/blueprint/packets/EllipticRegulators.json` reports 0 errors and 0 warnings. The original packet also passed: the checker does not test statement truth, test kinds, excerpt length, locators or cycles.
  - The source issues pass `scripts/check_errata.py` on a copy of the list.
  - `research/blueprint/intake.py check-files` passes on the three deliverables.

## Counts

| | before | after |
|---|---|---|
| nodes | 32 | 75 (32 corrected, 43 added, none deleted) |
| API items | 65 | 116 |
| unit tests | 48 (none with a kind) | 84 (all with a kind) |
| planets | 12 | 17 (at most 6 per layer) |
| sources | 1 | 6 |
| baseline declarations | 7 | 33 (27 added, 1 removed) |
| requests | 19 (none with `neededBy`) | 36 (23 stages, 13 Tau Ceti layers) |
| gaps | 5 (stage ids as `neededBy`) | 12 (node ids) |
| source issues | 0 | 23 |
| restructure entries | 3 | 10 |

Added nodes by stage: ER.2 1, ER.3 10, ER.4 3, ER.5 4, ER.6 2, ER.7 21, ER.8 2. No original node was verified unchanged.

## The main corrections

**Statements that were false, or false in the source and copied.**
- **ER.5, Bloch's Theorem 11.2.1.** The stage text transcribes (11.2.4) faithfully from the scan, but the printed formula is false:
  - (11.2.1) and (11.2.4) carry a spurious factor |μ_κ|, because L(2, χ^Gross) is a sum over ideals;
  - with the kernel printed in (11.1.1) the sign is reversed;
  - the index set must be the units modulo f unless every prime dividing g divides f (ℚ(√−7), C = 14 gives 2L otherwise).

  Checker B computed R_q(U) twice (q-series and divisor formula): the printed right side is −4L, −6L and −2L for 32a2, 36a1 and 49a1. The corrected formula, L(2, χ^Gross) = π χ̂(ḡ) g/(i y² C⁴) · R_q(U) with χ̂ built from ⟨x, y⟩, is now stated in ER.5/the-L-value-theorem with three computed instances. The 32a2 instance was re-checked here.
- **ER.7, Brunault's Théorème 1.** The printed statement has the wrong sign: it holds with the root number in place of w(E). Checker C checked all four even characters mod 11 to 45 digits and traced the error to the even part of Merel's (3.145). Merel's Théorème D is off by a factor 4, so Théorème 2 is off by −4, and (8) has π² for π. The packet's "verbatim" excerpts of Théorèmes 1 and 4 had dropped π, renamed τ(χ), and given the wrong symbol and the wrong hypothesis for Théorème 4 ({u_ψχ, u_χ̄} with χ ≠ ψ̄).
- **Normalisations.**
  - The regulator target over F has dimension [F : ℚ] = r₁ + 2r₂, not r₁ + r₂.
  - The source's functional has ∂̄ where the packet quoted d^c, a factor i/(4π) apart.
  - The "facteur" the packet left open is fixed in the same thesis: Beilinson's regulator is 2·r_E (Proposition 67, the proof of Theorem 68) and equals conj(R_q) at η*dz.
  - The divisor formula is r_E{f, g}(dz) = ½ conj(R_q((f)⋄(g))). Checkers A and B found it independently, and both checked it by direct numerical integration. It holds for all f, g, so the tame-residue hypothesis goes.
- **ER.3.**
  - Bloch's J_q converges without any correction and is not q-invariant (J_q(qx) − J_q(x) = −log²|x|). Zagier's Bernoulli term gives invariance, not convergence.
  - Brunault's complex function is −conj(R_q)/2, not R_q.
  - The Fourier series of D converge absolutely; only the Green function's series does not.
- **Examples and tests.**
  - ER.1: the real-case test failed without Brunault's normalisation (1.40).
  - ER.4: the test on the opposite diamond convention was false; the convention gives the reflection, not the negation.
  - ER.8's P¹ example was impossible as stated: Ω^{1,0}(P¹) = 0, and a tame-trivial symbol on P¹_ℚ is torsion.
  - The ER.8 examples named no curve, class or value.

**Ownership (PROTOCOL §15 and the accepted restructurings).**
- ER.1 re-planned the uniformisation that RS-06 gives to ModularCurvesPartII R12.1, and relied on a Mathlib surjectivity of the modular invariant that does not exist. It now keeps the normalised lattice choice.
- ER.2 re-planned η(f, g), which is Polylogarithms P.5's, and the real Deligne complex, which is MotivicEtaleKTheory M.8's (confirmed RT-AREA-ktheory-2/7, /24). It now imports both.
- ER.5's CM Hecke character is ComplexMultiplicationAndExplicitReciprocity CM.4's (RS-14), with CM.2 and GlobalNumberFields layers 9–10.
- Siegel units are KatoEulerSystems L0's. Manin–Drinfeld is ER.7's own target: no other stage plans it, and R14.6 covers bad-prime interfaces.
- Six suppliers were wrong: PadicHodgeRegulators D.1 is Coleman integration; SchemeKTheoryOperations S.6 is Adams operations; K2SymbolsBrauer T.1 is Steinberg groups of rings; ArithmeticGaloisRepresentations R01.6 is Tate modules; DirichletPadicLFunctions L0 is Dirichlet values; and BorelRegulators R.3 is unused. EllipticCurveModularity R29.5 (the parametrisation) was cited where R29.6 (the functional equation) is used.

**Closure.**
- Bloch's Lectures 8–11 are decomposed:
  - the truncation proof of the Steinberg relations as seven nodes;
  - Theorem 10.2.1;
  - the finite Fourier transforms (normalised by 1/C² in Lecture 10 and by 1/C in Lecture 11);
  - Lemmas 10.2.2 and 11.1.2–11.1.7.
- Brunault's chapter 3 is decomposed into 21 nodes: Eisenstein series and Kronecker's limit formulas, the Rankin–Selberg integral, Manin–Drinfeld, the units u_f with their divisors and rationality, the symbols in K₂ of the complete curve, the explicit theorem at finite level, spanning for X₁(p), the cycle formula, the rational combination for L(E, 2), the corrected prime-level formula and the X₁(11) example.
- The ER.8 examples are now explicit:
  - X₁(11) = 11a3 with r(ω) = −(πi/2)L′(E, 0), confirmed by direct integration;
  - 36a1 with a non-rational torsion point;
  - conductor 14.
- The unrealised stage targets now have nodes: lattice-basis change for R_q; the torsion ambiguity of number-field symbols; the Green function and Goncharov's function; the equivalence of the two Beilinson formulations; and the vertical step for CM curves.

**Presentation.**
- Every locator of chapters 1–2 was off by 8–9 pages, and several excerpts renamed the source's symbols (φ, β for η, τ).
- The coverage claimed `source_decomposed` everywhere, with empty `remaining`; all eight stages are now `partial`.
- The restructure entries were not in the protocol format. Two are withdrawn: one is settled by RS-14, and the other's premise (the scan is unreadable) is false.

## Baseline citations removed or fixed

- **Overstated.**
  - `NumberField.InfinitePlace` carries no conjugation action: places identify an embedding with its conjugate. The action is `NumberField.ComplexEmbedding.conjugate`.
  - `nrRealPlaces` does not "fix the dimension"; the dimension is r₁ + 2r₂ (`card_add_two_mul_card_eq_rank`).
  - `PeriodPair` is not oriented.
- **Removed:** `PeriodPair.weierstrassP`, which no corrected node uses (the uniformisation is R12.1's).
- **Added (27), all confirmed in the pinned index:**
  - `Function.Periodic.qParam` with its norm and non-vanishing;
  - the Bernoulli polynomials with `bernoulli_comp_one_add_X` (the q-invariance of J);
  - `ZMod.dft`, `ZMod.stdAddChar` and `gaussSum`;
  - `AddMonoidAlgebra` with `mapDomain` (the diamond convolution);
  - `WeierstrassCurve.LFunction` and `LSeries`;
  - `DirichletCharacter.LFunction` and `IsPrimitive`;
  - `CongruenceSubgroup.Gamma1` and `ModularForm.eta`;
  - `EulerProduct.exp_tsum_primes_log_eq_tsum`;
  - Tau Ceti's `invariantDifferential`, Rouché, the argument principle, π₁ of the torus and the genus of Weil differentials.
- **Format.** Every entry has `kind` and `checked`.

## Mistakes in the sources

23 entries, all with `review.verdict = confirmed`. `sourceVersions` lists six texts. No erratum was found for any of these sources.

- **Brunault, 13 entries.**
  - E1: "proposition 1.23" should be Proposition 17.
  - E2: the interchange of sum and integral in Proposition 24 needs a justification.
  - E3: J_{E,η} = −J(q; ·) is asserted without proof.
  - **E15:** Merel's Théorème D is off by a factor 4.
  - **E16:** Théorème 1 and (3.145) have the wrong sign.
  - **E17:** (8) has π² for π.
  - E18: coefficients in the proof of Corollaire 101.
  - E19: the sign in Théorème 8 is fixed only numerically.
  - **E20:** the introduction's claim that primitivity can be relaxed is contradicted by the body of the thesis.
  - E21, E22: misprints.
  - E23: the Ramanujan–Petersson bound is cited without reference.
  - E14: "connu" should be "connue" (the packet had silently corrected it inside a quotation).
- **Bloch, 9 entries.**
  - E4: a sign in Lemma 8.1.4's proof.
  - E5: the reduction to simple zeros in Theorem 9.1.1 is unproved.
  - **E7:** the Fourier kernel of (11.1.1) and Lemma 11.1.2 has the wrong sign.
  - **E8:** the spurious |μ_κ| in (11.2.1) and (11.2.4).
  - **E9:** the index set of U (a gap).
  - **E10:** Lemma 11.1.3 is wrong; the factor is 1/(γτ̄ + δ).
  - E11: c³ should be C³.
  - E12: "Theorem 10.3.2" (the same slip as EllipticKTheory/E13).
  - E13: Remark 11.2.2(i) omits the bad Euler factors.
- **Zagier, 1 entry.** E6: the sign of the Kronecker–Eisenstein expansion on p. 616.

## Lean

`research/blueprint/suggested/EllipticRegulators.lean` was rewritten against the final packet: 760 lines, importing only individual Mathlib modules. The original did not parse (a docstring on a `variable`), and 85 of its declarations had type `True`. I elaborated the new file with the Lean toolchain of Mathlib 082e2d3 (v4.34.0-rc2), with `LEAN_PATH` pointing at a prebuilt Mathlib 082e2d3; nothing was built. The result was exit 0 with 58 warnings, all `declaration uses 'sorry'`.

**Coverage.** A scripted check finds every node id, API item and test of the packet in the file.

**Objects stated concretely:**
- ER.1: the normalised period pair of ℤ + τℤ, `qParameter` (Mathlib's `qParam`) and the multiplicative presentation.
- ER.3:
  - D_q as an orbit sum;
  - Bloch's `blochJ`, which is not q-invariant (`blochJ_mul_q`);
  - Zagier's `ellipticJ` with the Bernoulli term, which is (`ellipticJ_mul_q`);
  - `ellipticR` and its lattice-basis change.
- ER.2: the regulator in coordinates at ω = dz.
- ER.4: the diamond convolution in Mathlib's group ring, with its tests; `divisor_formula` with the factor ½ and the conjugate; Lemma 10.2.2 and Theorem 10.2.1; the two finite Fourier transforms with their inversion and comparison.
- ER.5: the lattice-sum form and the 32a2 instance of the corrected Bloch formula.
- ER.7: Brunault's real-analytic Eisenstein series with their pole, SL₂(ℤ) and conjugation laws; the X₁(11) identities of Corollaire 101.

**Inputs owned elsewhere.** The Bloch–Wigner function is Polylogarithms P.1's and is not pinned, so it is a variable `D`, and statements about it are forms. Items that need X₁(N), K₂ of a function field, the Grössencharakter, the Deligne complex or the Green kernel are comments naming the missing object.

No statement is `True`, and `sorry` appears only in declaration bodies and proof obligations.

## Questions for the orchestrator

1. **The ER.5 stage text pins a false formula** (Bloch's printed (11.2.4) and the kernel of (11.1.1)). A restructure entry gives the corrected text. The stage text should be amended so that the next worker does not reintroduce it.
2. **MotivicEtaleKTheory M.8.** Its stage text says "R and ER provide the archimedean analytic identifications", while ER.2 now imports M.8's real Deligne complex, as P.5/regulator-induces-beilinson already does. A restructure entry proposes splitting the real Deligne complex into an early part of M.8 that needs no ER input, as RT-AREA-ktheory-2/24 intends.
3. **Brunault's Théorème 1 and Merel's appendix.** The sign and the factor 4 were found numerically by one checker, with every intermediate quantity computed. Any later packet that uses Merel's Théorème A or D should use the corrected statements (source issues E15–E17).
4. **Unowned inputs:**
   - Schappacher–Scholl's integral Beilinson theorem (the ER.7 stage text's named source, not obtained);
   - Siegel's Kronecker limit formulas;
   - a proof source for Manin–Drinfeld;
   - the regulator/pushforward compatibility for finite maps of curves;
   - the syntomic elliptic specialisation;
   - a published source for the integrality of unramified classes under potentially good reduction.

   Each is a gap with `neededBy`.
5. **Tau Ceti roadmap layers** are requests (13 of them), not prerequisites, because `check_blueprint.py` reads every `tauceti:` reference as a baseline declaration. This is the same tooling point raised in REV-EllipticKTheory.

## Summary

The review accepted the packet after correcting it in place. All 32 nodes were corrected and 43 were added. The review found two false formulas in the sources that the packet or its stage text had copied:
- Bloch's Theorem 11.2.1 (a spurious |μ_κ| and a sign);
- Brunault's Théorème 1 (a sign), with Merel's Théorème D off by 4.

Both are now stated correctly and checked numerically. The normalisations are fixed: the target dimension [F:ℚ], ∂̄ rather than d^c, Beilinson's regulator as 2·r_E, and the divisor formula with ½ and a complex conjugate. The packet now follows RS-06, RS-14 and RS-18 and the confirmed red-team ownership, and has no cycle. Bloch's Lectures 8–11 and Brunault's chapter 3 are decomposed, and the worked examples are explicit. The packet records 23 source mistakes, 12 gaps and 36 requests. The Lean file elaborates, with `sorry` as its only warning.
