# Review: HabiroRings (Habiro rings: relative arithmetic constructions and cohomological coefficients), stages HR.1–HR.7

Job `REV-HabiroRings` (issue #426), by Claude Code, session `cc-38267a`, 25 September 2026. The packet was written by Claude Code, session cc-7b31c4 (`BP-HabiroRings`); I had no part in it. **Status: accepted**, after the corrections below, which were made in place. The packet stays `partial`: its open gaps and requests are recorded.

## What was checked

- **Sources.** All four arXiv files are the current versions and are public; `sourceVersions` records them, with the author copies used for the errata search.
  - Wagner, *q-Hodge complexes over the Habiro ring*, arXiv:2510.04782v2.
    - The TeX e-print's SHA-256 is 9c338455…, equal to the packet's.
    - The PDF (82 pp., SHA-256 591d0bdf…) was read with its text layer.
  - The companion paper, Wagner, *q-Witt vectors and q-Hodge complexes*, arXiv:2410.23078v5.
    - e-print SHA-256 800822a7…; PDF SHA-256 c1c7426f….
    - The packet claimed it "was not obtained". It is public, and v5's numbering is the one the q-Hodge paper and the stage texts cite; v4's differs.
  - The packet now lists the companion paper as a second source, `Wagner.qWitt.2024`.
- **Checkers.** Three worked in parallel:

  | Checker | Scope |
  |---|---|
  | C1 | HR.1 and HR.2 (8 nodes) |
  | C2 | HR.3 and HR.4 (8 nodes) |
  | C3 | HR.5, HR.5-number-field-comparison, HR.6 and HR.7 (11 nodes), plus the empty baseline, the 15 requests, the gaps, the restructure entries, the coverage records and a stage-level cycle check over the whole packet |

  Each checker:
  - compared every locator and excerpt with the PDF text layer, the TeX, and rendered pages for displayed formulas;
  - read every pinned declaration it cites at Mathlib 082e2d3 and Tau Ceti f790474;
  - read every supplier stage in `data/atlas.json`;
  - wrote its corrections as a machine-applicable patch.

  I applied the patches, resolved their overlaps and validated the result. The overlaps:
  - All three rewrote the companion-paper gap.
  - C3 edited one HR.2 node and one HR.4 node, and rewrote every request.
  - C2's HR.4 and C3's HR.5 both constructed the finite stages and the limit.
- **What I checked myself.**
  - **Φ₅ mod 11.** Φ₅ splits into linear factors mod 11 (11 ≡ 1 mod 5; the roots are 3, 4, 5 and 9), so the claim in Lemma 2.12 that Φ_m is irreducible mod ℓ is false (E5).
  - **The Adams congruence.** ψ^p(x) − x ∉ pℤ[x] for the toric structure, so the packet's congruence "ψ^p ≡ id mod p" is false.
  - **Cycles.** None at node level. At stage level: none from the atlas (`requires` and `stageEdges`) plus this packet. Then with every other packet on main added (see "Cycles").
  - **Baseline.** Every baseline declaration is in the pinned index and is cited by a node.
- **Checks.**
  - `python3 scripts/check_blueprint.py --index <pinned declaration index> research/blueprint/packets/HabiroRings.json`: 0 errors, 0 warnings. The original packet also passed; the checker does not test test kinds, stage-level cycles or whether a statement is true.
  - My own validation:
    - every test has a §12 kind;
    - every excerpt is literal and at most 300 characters;
    - every gap and every request has `neededBy`.

## Counts

| | before | after |
|---|---|---|
| nodes | 27 | 50 (29 added, 21 corrected, 6 removed) |
| API items | 56 | 164 |
| unit tests (all with a §12 kind) | 40 (none with a kind) | 81 |
| planets | 10 | 13 (at most 4 per layer) |
| baseline declarations | 0 | 54 |
| requests (all with `neededBy`) | 15 (none with `neededBy`) | 18 |
| gaps (all with `neededBy`) | 3 | 8 |
| restructure entries | 2 | 7 |
| source issues | none recorded | 12 |
| sources | 1 | 2 |

**Verified unchanged:** none. Every original node needed a correction.

**Removed, with their content moved.** All six were registers or notes:
- HR.3/what-the-degeneration-does-not-license: its content went to Corollary 2.4's hypotheses and the HR.3 coverage note.
- HR.5/the-cyclotomic-splitting-repair: the mathematics went to HR.5/the-ell-adic-taylor-comparison, the counterexample to HR.7/phi-five-over-f-eleven, and the mistake to E5.
- HR.6/the-module-interfaces: went to HR.6/completed-scalar-extension, HR.6/the-transported-regulator and the HR.6 coverage note.
- HR.6/the-late-return-edge: went to the HR.6 coverage note. Its HQ.8 and PR.0 prerequisites were unjustified.
- HR.7/the-acceptance-tests: realised as four HR.7 theorems and unit tests.
- HR.7/the-executable-boundary: it claimed what the old Lean file does not do. Mathlib's equaliser is in the baseline instead.

## The main corrections

**Throughout.**
- **Excerpts.** Every excerpt was a quotation "with the mathematics written out in words", and some came from a commented-out TeX draft. All are now literal, copied from the PDF text layer or the TeX, with statement numbers and PDF pages.
- **Baseline.** It was empty. It now holds 54 declarations, among them:
  - formally étale lifting (`Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete`, `Algebra.FormallyUnramified.ext_of_iInf`, `IsAdicComplete.liftRingHom`);
  - `Algebra.Etale`, `MvPolynomial.expand` and the cyclotomic-polynomial lemmas;
  - `WittVector` and `TruncatedWittVector`;
  - `NumberField.not_dvd_discr_iff_isUnramifiedIn`;
  - Mathlib's equaliser in `CommRingCat`.
  - Neither library has Λ-rings, big Witt vectors, q-Witt vectors or Habiro material.

**HR.1.**
- **The Adams congruence was wrong.** The packet stated it as "the operation at a prime is the identity modulo that prime". It is ψ^p(x) ≡ x^p mod p (q-Witt 2.31), with ψ^1 = id and ψ^{mn} = ψ^m∘ψ^n.
- **Perfectly covered Λ-rings.**
  - Three equivalent descriptions are now proved from the companion paper's footnote (2.3).
  - The colimit perfection is added.
  - A non-example is added: ℤ[x,y]/(xy) is torsion-free with the toric structure, but ψ^p is not flat on it.
- **The linearised Frobenius.**
  - The step "classical mod p" (Stacks 0EBS) is now a lemma proved from Mathlib's scheme-level results.
  - A no-global-lift example is added: ℤ[∛2, 1/6] at 5.
- **morphisms-of-pairs.** It is now a definition rather than a register.

**HR.2.**
- **Split by statement.** The appendix is read in full; B.1–B.8 are split into their own nodes.
- **StableHomotopyKTheory H.3 was the wrong supplier.** It is the plus construction; the atlas lists H.6.
- **The solid comparison.** It is now Lemma B.8, not a list of readings. A restructure entry proposes moving the solid nodes off HR.2's critical path, since VS2 is much deeper in the atlas.

**HR.3.**
- **The divisor poset.**
  - "The surviving intersections are the prime edges" is false: for m = 4 the pair {1, 4} survives, since (q−1, q²+1) = (q−1, 2).
  - It is now a lemma with the source's chains T_{d,p} and the p-adic disjointness the stage asks for.
- **Ordering.** The morphism-level equivalence of completed categories now precedes Corollary 2.4, as in the source, and Wagner's general descent principle (Lemma 2.2) is added.
- **E5:abstract does not own abstract descent.** HR.3 owns Lemma 2.2.

**HR.4.**
- **Decomposed from the companion paper:**
  - truncated big Witt vectors and q-Witt vectors (Definition 2.8, Lemma 2.9);
  - the Λ-ring comparison maps;
  - relative q-Witt rings (Definition 2.40 onward);
  - q-Witt vectors of étale maps (Proposition 2.48) and the ghost maps under étale base change (Corollary 2.51);
  - the finite relative Habiro rings, and the staticity of their limit.
- **The obstruction to restriction maps.** It is now a theorem with the source's hypotheses (m = p^α, p·1_R ≠ 0).
- **Theorem 2.9 needs R étale** (E2).
- **A stage cycle removed.** The prerequisite on HabiroCohomologyFoundations HQ.4 closed a cycle, since HQ.4 imports degree-zero q-Witt rings from HR.4.

**HR.5.**
- **The relative Habiro ring.** It is the limit of HR.4's finite stages, with staticity from HR.4.
- **The equaliser presentation (Lemma 2.12).**
  - The packet said the canonical map "re-expands a series at the coarser root", which is false: it is extension of coefficients in the same variable.
  - The ℓ-adic step of the source's proof uses a false irreducibility claim (E5). It is replaced by the finite étale algebra 𝔽_ℓ[q]/Φ_m, which does not change the conclusion.
- **Added:** the ℓ-adic Taylor comparison, the untwisted case and completed base change.
- **Roots, choices and substitutions.** Its order relative to the equaliser was reversed, and it now builds on HC.3's nodes rather than on the HC.3 stage.

**HR.5-number-field-comparison.**
- **Corollary 2.13.** Its hypothesis is Δ = disc F, not "divisible by the discriminant and by six" (that is GSWZ's regulator setting). The étaleness of O_F[1/Δ] is added as a lemma, closed by Mathlib's `NumberField.not_dvd_discr_iff_isUnramifiedIn`.
- **Remark 2.14.** It now identifies H_{ℤ/ℤ} with HabiroCyclotomicCompletions HC.1's ring and the projections with HC.3's Taylor maps.
- **Ownership.** HabiroNumberFields HB.6 owns the number-field ring. The comparison imports it and does not construct it first.

**HR.6.**
- **The degree-zero identification.** It is Corollary 3.13 for R étale, proved through HQ.3–HQ.5's nodes.
- **Added:** completed scalar extension, the transported regulator, and the non-injectivity of the (q−1)-completion for ℤ[1/p].
- **The vanishing of the regulator after (q−1)-completion** is asserted in the source (p. 4) and is recorded as a gap.

**HR.7.** The acceptance tests are now theorems:
- Φ₅ over 𝔽₁₁;
- inverting a prime (ℤ_(p) is not étale over ℤ);
- constant families do not glue, shown by ℤ[∛2][1/6] at 5;
- the stage is not the naive completion when 5 | m (companion Corollary 2.52).

**Requests.**
- **Every one now has `neededBy`** and quotes its supplier's stage text.
- **Removed:**
  - HQ.8 (HR.6 does not require it);
  - H.3 (replaced by H.6).
- **Added:** E1, E3, E5:presentability and HC.5.
- **HQ.4** is re-pointed to HR.6 only.

**Coverage.** The coverage records now follow the gaps: HR.1–HR.4 and HR.6 are `partial`, and HR.5, its number-field part and HR.7 are `source_decomposed`.

## Cycles

- **Within this packet, against the atlas:** none after the corrections. Before, the HR.4 → HQ.4 prerequisite closed a 2-cycle, and HR.6's prerequisite on HQ.8 was unjustified.
- **With every other packet on main added,** three loops remain: HR.6 → HQ.3, HQ.4, HQ.5 → HR.6.
  - HR.6's edges into HQ.3–HQ.5 are atlas-justified: HR.6 requires HQ.3, HQ.4 and HQ.5.
  - The closing edges are in the HabiroCohomologyFoundations HQ.1 packet. HQ.3/the-coordinate-model-and-the-etale-case lists HR.6/the-degree-zero-identification and states Corollary 3.13 itself, and HQ.5/the-export-to-the-coefficient-roadmap lists HR.6. HQ.4 reaches HR.6 through HQ.3.
  - They are recorded as a restructure note, with the proposal that the HQ.1 packet drop them. HR.6 owns Corollary 3.13 by both stage texts.

## Source issues

The packet recorded none. The review adds twelve, each checked at its locator and marked `confirmed`. The arXiv version histories and the author copies (still printing them) were searched.

| id | source | kind | locator | finding |
|---|---|---|---|---|
| E1 | q-Hodge | misprint | proof of Cor. 2.4, p. 14 | lim over ⌟^r should be over ⌟^T |
| E2 | q-Hodge | misprint | Thm 2.9, p. 16 | "R an A-algebra" should be "R an étale A-algebra"; 2.7 defines the stages only for étale R |
| E3 | q-Hodge | misprint | proof of Thm 2.9, p. 17 | "static modulo p" should be "modulo q^m − 1" |
| E4 | q-Hodge | misprint | proof of Lemma 2.12, pp. 18–19 | ζ_m, Φ_m, ψ^m should be ζ_d, Φ_d, ψ^d in the rationalised step |
| E5 | q-Hodge | error | proof of Lemma 2.12, p. 18 | "Φ_m is irreducible in 𝔽_ℓ[q] if (m, ℓ) = 1" is false (Φ₅ mod 11, Φ₈ mod 3); the unit argument works with 𝔽_ℓ[q]/Φ_m, so the lemma stands |
| E6 | q-Hodge | misprint | proof of Cor. 3.13, p. 27 | cites Theorem 3.11(a); it needs (b) |
| E7 | q-Hodge | misprint | pp. 77–78 | "Postikov", "exaustive", "Nayama" |
| E8 | q-Hodge | misprint | proof of Lemma B.2, p. 78 | the first arrow should be a_i − (1 − q^i)a_{i−1}; as printed the composite is not zero |
| E9 | q-Witt v5 | misprint | Lemma 2.4, p. 9 | "elements of A" should be "elements of R" |
| E10 | q-Witt v5 | misprint | 2.6, p. 10 | the target of V_{m/d} should be W_m(R) |
| E11 | q-Witt v5 | misprint | Cor. 2.35, p. 28 | "Let R be a Λ-ring" should be "Let A be" |
| E12 | q-Witt v5 | misprint | Prop. 2.48, p. 33 | the target of F_{m/d} should be q-W_d(R/A) |

The companion Lemma 2.1 is wrong for α = 0. That is already recorded and confirmed as `HabiroCyclotomicCompletions/E14`, so it is not duplicated here; the divisor lemma cites it.

## Suggested Lean file

**The old file.** It compiled, but 87 of its statements were `: True := by sorry`. Several definitions were Prop-valued placeholders (`frobLift`, `linearisedFrob`, `habiroLocalisation`, `habiroCompletion`, `habiroTensor`), `LambdaRing` had `Unit` fields, and `generic_equaliser_universal_property` was of type `True`. It violated §13.

**The new file.**
- **Size.** It is 3661 lines, rewritten by a separate agent against the corrected packet.
- **Header.** It states the pinned conventions:
  - Λ-rings in torsion-free Adams form, with ψ^p(x) ≡ x^p mod p;
  - the Habiro ring as lim_m A[q]^∧_{(q^m−1)};
  - H_{R/A} for R étale over a perfectly covered A;
  - q-Witt v5 numbering.
- **Honest carriers.**
  - `LambdaRing`: a structure whose Frobenius congruence is a real field, with `adams : ℕ+ →* (A →+* A)` and the toric structure through `MvPolynomial.expand`.
  - The colimit perfection, as a `Ring.DirectLimit`.
  - The category of étale pairs.
  - `BigWittVector`: a real carrier R^S with ghost maps, restrictions and Teichmüller lifts; its ring structure is left to the node that plans it.
  - `QWittVector`: the quotient of q-Witt Lemma 2.9.
  - `RelQWittVector`: the quotient of Lemma 2.41.
  - `RelHabiroStage`: the ring of glued families.
  - `relativeHabiro`: their limit, as ordinary rings.
  - Stand-ins for PR.0's δ-rings and for HC.1's cyclotomic completions follow those roadmaps' names.
- **What is stated in Lean.**
  - 131 of the 164 API items, 73 of the 81 tests as `example`s, and 19 of the 33 theorem nodes.
  - Among them: the divisor-poset lemma; the obstruction to restriction maps; the ring-level Theorem 2.9, transitions and Lemma 2.12; the ℓ-adic Taylor comparison; Remark 2.14; the étaleness of O_F[1/Δ]; and all four HR.7 tests.
  - Several statements are actually proved rather than `sorry`, for example:
    - ψ²(x² + 3x) = x⁴ + 3x²;
    - Φ₃ − qΦ₂ = 1;
    - q(1 + q − q²) − 1 = −(q;q)₂;
    - the Hensel lifts 2786, 7825, 1963, 2066 of the roots of Φ₅ modulo 11⁴, by `decide`.
- **What is a comment instead.** Everything needing derived categories, E∞-algebras, derived completions or solid spectra names its missing carrier and supplier (E0, E1, E3, E5, DD.1, VS2, H.6, HQ.3–HQ.5, HB.6, HB.7, or a gap). Every packet name appears in the file.
- **Checks.**
  - It has no `True`, `Unit` or opaque carriers, no `set_option` and no root imports.
  - It elaborates with exit code 0 against Mathlib 082e2d3 and the Tau Ceti f790474 sources. The only warnings (302) are uses of `sorry`.
  - The Tau Ceti modules it imports are not built in the local Mathlib-082e2d3 project, so the five modules it needs (`TauCeti.RingTheory.Cyclotomic.Lift` and its dependencies) were compiled with `lean -o` from the f790474 sources and placed first on `LEAN_PATH`; the file header says so.

**Corrections to the packet found while formalising.** Each was applied in the packet and noted in the node's `checked` entry.
- **The divisor lemma, part (b).** It needs two *distinct* elements. For a singleton {d}, the pair (d, d) satisfies the stated condition, yet {d} = T_{d,ℓ}.
- **Habiro completion on D(A[q]).** It was defined only on D(A[q^{±1}]), while the API and HR.5 complete A[q]-modules. It is extended by the same formula: each (q^m−1)-completion is an A[q^{±1}]-module, and M^∧_H ≃ (M ⊗ A[q^{±1}])^∧_H.
- **Index sets.** They are the positive integers; for m = 0, q⁰ − 1 = 0.
- **Change of roots.** It is independence of the compatible system of roots. Ẑ^× acts trivially on the embedding-free coefficient algebra, and it is in neither library.
- **"Relatively perfect".** It was never defined; it is now defined in the cyclic-map API item.
- **`frobLift_self`.** A tautological clause is dropped.
- **`relativeHabiro.lift`.** The universal property of the limit holds for every B, not only Habiro-complete B.
- **Companion Corollary 2.52.** HR.7's naive-completion test uses it, and no node stated it. It is now the lemma HR.4/an-isomorphism-with-the-naive-quotient-forces-a-frobenius-lift, with its proof from Proposition 2.48 and Corollary 2.51.

**Library findings (no packet change).**
- **Quotients of subalgebras.** Quotients of bare subalgebras and of `(Localization.Away 2)[X]` fail to find `HasQuotient` at this Mathlib.
- **A ℤ-module instance mismatch** on tensor products of Frobenius twists forces the embedding-free coefficient algebras.

## Questions for the orchestrator

1. **Cycles in the HabiroCohomologyFoundations HQ.1 packet.** Its nodes HQ.3/the-coordinate-model-and-the-etale-case and HQ.5/the-export-to-the-coefficient-roadmap depend on HR.6 while HR.6 requires HQ.3–HQ.5, and the same packet has cycles inside HQ.2–HQ.5 (see "Cycles"). That packet is outside this job's deliverables.
2. **Duplication with HQ.4.** HQ.4/there-are-no-restriction-operators-and-what-replaces-them re-proves the obstruction that HR.4 now states (companion 2.14). One of the two should import the other; this is recorded as a restructure note.
3. **HR.2's solid nodes.** A restructure entry proposes moving them to a sub-stage off HR.2's critical path: VS2 sits far deeper in the atlas, and only Lemma B.8 uses them.
4. **Part README.** `research/blueprint/readmes/HabiroRings.md` is not a deliverable of this job, so it was not edited. It repeats the corrected claims and should be regenerated from the corrected packet:
   - the companion paper was unobtainable;
   - the Adams congruence "ψ^p ≡ id";
   - the divisor-poset "prime edges".
5. **Missing suppliers.** No stage owns big Witt vectors, free Λ-rings, solid light condensed spectra, or the higher-categorical inputs of the descent principle. These are recorded as gaps.
