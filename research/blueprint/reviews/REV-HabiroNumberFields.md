# Review: HabiroNumberFields (Number-field Habiro rings, finite regulators and K₃-graded modules), stages HB.1, HB.2, HB.6, HB.7

Job `REV-HabiroNumberFields` (issue #425), by Claude Code, session `cc-442dc5`, 25 September 2026. The packet was written by Claude Code, session cc-7b31c4 (`BP-HabiroNumberFields`, issue #748, PR #2890). I had no part in it. **Status: accepted**, after the corrections below, which were made in place. The packet stays `partial`: all four stages are `partial`, and the open points are recorded as 10 gaps, 14 requests and 11 restructure entries.

## What was checked

- **Sources.**
  - **Calegari–Garoufalidis–Zagier (CGZ)**, *Bloch groups, algebraic K-theory, units, and Nahm's conjecture*. The recorded hash is that of the arXiv **v3** PDF; v2 has the same text, and v1 differs at Theorem 1.2, Remark 1.4 and §2.1. The packet had read only the introduction. The checkers read §§1–7, including every proof, with pp. 3 and 18 rendered to check the formulas.
  - **Hutchinson**, *The Chern class for K₃ and the cyclic quantum dilogarithm*; the packet had the title wrong. The recorded hash is that of the arXiv **v4** e-print, which is the version the stage text cites. It was read in full and compared with v1–v3 at Theorem 3.1 and Lemma 4.1.
  - **Garoufalidis–Scholze–Wheeler–Zagier (GSWZ)**, *The Habiro ring of a number field*. The recorded hash is that of the arXiv **v2** PDF; v1 is identical at every cited statement. Read: §§1.3–1.5, 1.7, 2.1, 3.1–3.3 and 5.1–5.3, with pp. 6–11 rendered.
  - Added: Weibel's *K-book*, IV.2.5–2.6 and V.11.10, for the Bott element.
- **Checkers.** Three worked in parallel. Each compared locators and excerpts with the source pages, opened every cited declaration at Mathlib 082e2d3 and Tau Ceti f790474, read the supplier stages and the sibling packets, and computed in PARI/GP:

  | Checker | Scope |
  |---|---|
  | A | HB.1 (4 nodes), the baseline, the library audit, the K-theory suppliers, the Lean file |
  | B | HB.2 (5 nodes), CGZ and Hutchinson |
  | C | HB.6–HB.7 (9 nodes), GSWZ, the packet-level fields, cycles and consumers |

- **What I checked myself.**
  - **The eigenspace convention** (PARI). In ℚ(ζ₅), v = ∏_{k=1}^{4}(1 − 2ζ₅^k)^k satisfies: σ₂(v)/v³ and σ₃(v)/v² are fifth powers, while σ₂(v)/v² and σ₃(v)/v³ are not. So v is in the χ^{−1}-eigenspace, and CGZ's printed law R_{ζ^k} = R_ζ^{k^{−1}} is right. The packet's excerpt, R_{ζ^k} = R_ζ^k, is wrong.
  - **GSWZ (21) and (24)** on the rendered pages. The target of (21) is ∏ (p/x) R^∧_p[ζ_m][[x]], not p·x. (24) is the product f(q^γ)^γ f(q^{−1}) ∈ H_{R[1/γ]}|γ.
  - **The counterexamples behind three source issues:**
    - (20) with f_m = (1 + x/ζ_m)^{1/5} (E24);
    - the ℚ(i) idempotent in the class of 4 (E21);
    - the count for F = ℚ, n = 3 (E2).
- **Ownership and cycles.** The accepted K3BlochGroups packet owns the Bloch conventions, κ, Suslin's sequence and the comparison modulo n (V.3–V.6). HabiroRings HR.1 owns the Frobenius lift of étale algebras, and HabiroCyclotomicCompletions HC.3 the p-adic re-expansion. A validator checks that:
  - every prerequisite resolves, and every stage prerequisite has a request;
  - every request and gap names nodes;
  - the node graph is acyclic and follows the stage order;
  - no path leads from a cross-roadmap prerequisite back to an HB stage at or after the citing one, following node prerequisites, atlas `requires` and every restructure link.

  It finds no cycle. One cycle is avoided on purpose: HabiroNahmSeries HB.4 requires HB.2, so CGZ Theorem 7.4, which is proved through HB.4, cannot be an HB.2 prerequisite (see below). No consumer packet cites an HB node id, so nothing breaks.
- **Checks.**
  - `python3 scripts/check_blueprint.py --index <pinned declaration index> research/blueprint/packets/HabiroNumberFields.json` reports 0 errors and 0 warnings. The original packet also passed; the checker does not test statement truth, test kinds, excerpt length, locators or cycles.
  - The source issues pass `scripts/check_errata.py` on a copy of the list.
  - `research/blueprint/intake.py check-files` passes on the three deliverables.

## Counts

| | before | after |
|---|---|---|
| nodes | 18 | 67 (17 corrected, 50 added, 1 deleted) |
| API items | 50 | 132 |
| unit tests | 36 (none with a kind) | 82 (all with a kind) |
| planets | 6 | 15 (at most 6 per layer) |
| sources | 3 | 4 |
| baseline declarations | 2 | 42 (all with `kind` and `checked`) |
| requests | 15 (none with `neededBy`) | 14 |
| gaps | 4 (stage ids as `neededBy`) | 10 (node ids) |
| source issues | none | 30 |
| restructure entries | 3 (not in the protocol format) | 11 |

Added nodes by stage: HB.1 12, HB.2 24, HB.6 5, HB.7 9.

## The main corrections

**Statements that were false.**
- **HB.1, the Bloch conventions.** The packet had four errors here:
  - It said the two conventions have "the same generators and different relation sets". They differ in generators, in the target of the boundary, and in the relations, and there are three of them.
  - It said the comparison maps run "in both directions". They run one way: B ⊆ B̃ ↠ B_CGZ.
  - It said the groups differ by "two- and six-primary" groups; the Lean header said 2- and 3-primary. The kernel and cokernel are elementary abelian 2-groups.
  - "No roots of unity in the field" is impossible, since −1 ∈ F.

  The node is now a thin import from K3BlochGroups V.3–V.6. It uses only the identification modulo odd n prime to w_F.
- **HB.1, other errors.**
  - **The Chern class.** Its target is the multiplicative group modulo N-th powers, not the units, and it needs N odd.
  - **The excerpt of CGZ Remark 1.3.** It reversed the exponent law, which would put the image in the χ-eigenspace.
  - **The excluded integer M_F.** The packet said M_F is defined but never defined it. It is 6|Δ_F||K₂(O_F)|, or 2|Δ_F||K₂(O_F)| when 9 ∤ n (CGZ Remark 1.4). With these values, M_ℚ = 12 and M′_ℚ = 4.
- **HB.2.**
  - **The root-change test was false.** Changing ζ to ζ^k raises the class to the k^{−1}-th power.
  - **The exported units.** The packet attached units to Bloch classes for n prime to the excluded set. GSWZ (16) define ε_m = c_{ζ_m}² on K₃(K) for every m; for ℚ(√−3) and m = 3, R_ζ does not exist, but ε₃ is needed.
  - **The Bott element** lies in K₂(R; ℤ/N), not K₁, and needs no invertibility of N.
  - **The "weaker comparison outside the refinement" is vacuous.** For a number field, n prime to M_F already forces n odd and μ_n(F) = 1.
- **HB.6.**
  - **The coefficient rings** must be the full algebras R ⊗ ℤ[ζ_m]; for ℚ(i) and Δ = 4 they split.
  - **The Frobenius** lifts no single residue field.
  - **The test "not an automorphism"** was false. φ_p is an automorphism of R^∧_p; what fails is that it need not be induced by Aut K (ℚ(∛2), p = 5).
  - **GSWZ's compatible roots of unity** were missing. They are needed: for ω_m = e^{2πi/m}, v₂(ω₁₀ − ω₅) = 0, so the shift does not converge.
  - **The gluing condition** was stated before the substitution it uses.
- **HB.7.**
  - **(21)** was transcribed with p·x. With p·x no section exists whenever D_p(ξ) ≠ 0.
  - **(24)** was transcribed as a ratio in the Habiro ring of R/γ.
  - **"Multiplication maps need not be isomorphisms"** contradicts GSWZ Theorem 2.
  - **Unproved operations.** Scalar extension, the Galois action and the K₃ transfer were asserted, though GSWZ does not prove them; they are now a gap.
  - **The evaluation target** is false for ξ ≠ 0.

**Library (the baseline and the audit).**
- **`PowerSeries.subst`** needs a nilpotent constant coefficient (`HasSubst`, Substitution.lean:40), so it cannot substitute ζ_pm − ζ_m. HB.6 now cites HabiroCyclotomicCompletions HC.3/p-adic-closeness-of-roots and HC.3/p-adic-re-expansion, which are built on `PowerSeries.eval₂Hom`. `subst` is kept only for q ↦ q^γ.
- **The cyclotomic character** is Mathlib's `IsPrimitiveRoot.autToPow`, equal to `modularCyclotomicCharacter`; the packet had planned it again.
- **Added (40 declarations):**
  - Mathlib: discriminants, torsion order, the unit rank, S-units and Selmer groups, Hilbert 90 for finite extensions, inflation–restriction, finite cyclic group homology, `PowerSeries.HasEval`/`eval₂Hom`, the linear-disjointness and unramified-prime criteria;
  - Tau Ceti: the Kummer map and the Selmer exact sequence.

  Every entry has `kind` and `checked`.

**Closure.**
- **HB.1.** CGZ §3 is decomposed:
  - the cyclotomic character and kernel-form eigenspaces, and the projector only when |G| is invertible (with the n = 9 counterexample);
  - Sah's lemma, and CGZ's c_ζ with t_ζ;
  - Lemmas 3.1 and 3.3–3.5, and Theorem 3.2 (imported);
  - Proposition 2.12(a),(b), and Theorem 1.5 with its count corrected for 3 | n.

  The HB.1 stage text asks for exactly this.
- **HB.2.** CGZ §§2 and 4–5 and Hutchinson are decomposed:
  - the descent from P_ζ in the Kummer extension to R_ζ, with the cup-product obstruction;
  - the KMS identity, checked exactly by checker B;
  - the dependence on ζ, the distribution relation, change of field, the étale Bloch group, and the element η_ζ;
  - the local maps at primes of norm ≡ −1, and CGZ Theorem 1.6 with field independence proved through the local maps. The source's compositum argument fails (E13).
  - Hutchinson's cyclic bar chains, the Bott element, the Hurewicz step, Soulé's formula, and c_ζ(η_ζ).
- **HB.6.** New nodes: the compatible roots, the p-completed ring, the p-adic classical ring, the class decomposition and the abelian case. The F = ℚ comparison now cites HC node ids, not the stage HC.6: that stage no longer supplies the comparison after REV-HabiroCyclotomicCompletions, and citing it would close a cycle.
- **HB.7.** New nodes: Dwork's lemma, the Pochhammer sections, Theorem 1 (local freeness), the extension to all roots, Theorem 2 (the ring case and tensor products), the involution pairing, the vanishing and constant-term statements of Proposition 1.5.

**Deleted.** `HB.2/bar-cycles-bott-element-and-souls-formula`. It bundled four declarations, put the Bott element in the wrong degree, and depended on the node whose proof needs it.

**Requests.**
- **Removed:** nine requests that named the wrong supplier or pointed the wrong way:
  - V.1 is the Steinberg-group model;
  - V.2 is indecomposable K₃;
  - M.3 was misused for HB.1; it is kept for HB.2's K₂ step;
  - H.2 is Quillen's Theorems A and B;
  - HR.5 and HC.6 consume HB.6;
  - HC.1, HC.3, HC.5, N.1, N.4, N.5, V.3 and V.4 are now cited by node id.
- **Added:** M.7 (which the HB.1 stage requires), M.1, H.6, GeneralAlgebraicKTheory K.7, KTheoryFiniteLocalFields L.2 and L.7, PadicHodgeRegulators D.3, HC.4, and the Tau Ceti ProfiniteCohomology layers 5 and 9 and Chebotarev layer 10. Every request has `neededBy`.

**Hutchinson's refinement.** R_ζ = c_ζ² needs CGZ Theorem 7.4, R_ζ(η_ζ) = ζ². Theorem 7.4 is proved only through the Nahm-sum asymptotics that HabiroNahmSeries HB.4 plans, and HB.4 requires HB.2. So the refinement node stays in HB.2 with a gap, and a restructure entry proposes a stage after HabiroNahmSeries HB.4 for the final equality. The sign of the scalar is also open: Hutchinson's Lemma 4.1 gives ζ^{−1} under his own stated normalisations (E14), and neither source fixes the conventions. HB.7 does not need the refinement, because GSWZ define ε_m = c_{ζ_m}² directly.

## Mistakes in the sources

There are 30 entries, all with `review.verdict = confirmed`. Four were found by two checkers independently and merged. No erratum was found for any of the three papers.

- **CGZ (12).**
  - **E2:** the count in §3.5 is wrong when 3 | n. For F = ℚ, n = 3 both sides are ℤ/3, not (ℤ/3)^{r₂} = 0.
  - **E4:** the set S of Theorems 1.2 and 1.5 may depend on n, and "n prime to w₂(F)" excludes n = 3.
  - **E13:** the compositum argument for field independence fails.
  - **E19:** Definition 1.1's C(F); already recorded by K3BlochGroups.
  - E1 (ζ^{⊗n} for ζ^{⊗m}), E3, E5, E6, E7, E10, E11 and E12.
- **Hutchinson (5).**
  - **E14:** Lemma 4.1's sign.
  - **E15:** R_ζ = c_ζ² is proved only for n prime to M_F.
  - E8, E9 and E16.
- **GSWZ (13).**
  - **E21:** Remark 1.2 is false as indexed; for ℚ(i), Δ = 4, the factor of the class of 4 has an idempotent.
  - **E22:** the image of the Taylor maps is attributed to Habiro, who proves only injectivity.
  - **E23:** the proof of Theorem 2 shows only that multiplication is defined.
  - **E24:** Definition 1.3's shape (20) makes Theorem 1 false already for ξ = 0.
  - **E20:** footnote 1 needs φ_m^{−1}.
  - E17, E18, E25–E30.

## Lean

`research/blueprint/suggested/HabiroNumberFields.lean` was rewritten against the final packet: 1395 lines, importing only individual Mathlib modules. The original elaborated, but 68 of its statements had type `True`, 18 definitions were propositions, several definitions forgot the field, and no test appeared.

The new file assembles the three checkers' drafts, which I made compile, and adds the remaining names. I elaborated it with the Lean toolchain of Mathlib 082e2d3 (v4.34.0-rc2), with `LEAN_PATH` pointing at a prebuilt Mathlib 082e2d3; nothing was built. The result was exit 0 with 151 warnings, all "declaration uses `sorry`".

**Coverage.** A scripted check finds every node id, API item and test of the packet in the file, and no statement of type `True`.

**Objects stated concretely:**
- the cyclotomic character and eigenspaces, M_F, and power classes;
- D_ζ as a polynomial with its identities, and P_ζ over finite fields;
- the χ^{−1}-part of the Selmer group;
- the cyclic bar chains;
- the compatible roots through the transition maps of R[t]/(Φ_m), the p-adic completions with the Frobenius, and the Habiro ring as a subring of families (GSWZ (13));
- the p-completed ring, the class idempotents and the classical comparison for K = ℚ;
- invertible sections with the corrected shape and the defect (21);
- the module set with (24) as a product, and γ* with τ.

**Inputs owned elsewhere.** K₃, the Bloch groups, Soulé's classes, the Bott element and the p-adic regulator enter as parameters, with statements as forms, or as comments naming the owner. The re-expansion is a marked stand-in for HC.3's.

## Questions for the orchestrator

1. **Hutchinson's refinement and HabiroNahmSeries HB.4.** The final equality R_ζ = c_ζ² needs CGZ Theorem 7.4, whose only proof is through HabiroNahmSeries HB.4, and HB.4 requires HB.2. A restructure entry proposes a stage after HB.4.
2. **The sign of the scalar.** Hutchinson's Lemma 4.1 as printed gives c_ζ(η_ζ) = ζ^{−1}. The conventions must be fixed once, in MotivicEtaleKTheory M.8's Chern classes, before any consumer uses ε_m = R_ζ.
3. **HB.1's stage text** asks HB.1 to construct the Bloch-convention comparison, which K3BlochGroups V.3/V.6 (accepted) already plans; it should import it. The text should also name M.8, M.1 and ProfiniteCohomology among its inputs.
4. **HB.7's stage text** asks for scalar extension, a Galois action and a K₃-transfer compatibility that GSWZ does not treat. HabiroRings HR.6 plans the scalar-extension and Picard comparisons.
5. **GSWZ's errors** reach consumers that use GSWZ directly (HabiroRings, HabiroNahmSeries):
   - Definition 1.3's shape (E24);
   - Remark 1.2 (E21);
   - footnote 1 (E20);
   - the unproved image statement (E22).
6. **Unowned inputs, recorded as gaps:**
   - Keune's injection;
   - the Galois-module structure of the units;
   - the KMS identity's proof;
   - Hutchinson's identification of η_ζ;
   - GSWZ (14);
   - GSWZ Theorem 10 and Theorem 2's missing steps.

## Summary

The review accepted the packet after correcting it in place: 17 nodes corrected, 50 added and 1 deleted. False statements corrected:
- the Bloch conventions differ by 2-groups, one way;
- the exponent law R_{ζ^k} = R_ζ^{k^{−1}} (the excerpt reversed it);
- the Chern-class target and hypothesis;
- the Bott element's degree;
- GSWZ (21) has p/x and (24) is a product over R[1/γ];
- the modules are invertible (GSWZ Theorem 2).

`PowerSeries.subst` cannot perform the gluing shift, so HB.6 cites HC.3's re-expansion. CGZ §§2–5, Hutchinson's argument and GSWZ Theorems 1–2 are decomposed. The exported units are ε_m = c_{ζ_m}² for every m. The refinement R_ζ = c_ζ² waits on CGZ Theorem 7.4, which is proved through HabiroNahmSeries HB.4 (gap and restructure). Thirty source mistakes are recorded, several in stated results of GSWZ and CGZ. The Lean file elaborates with `sorry` as its only warning.
