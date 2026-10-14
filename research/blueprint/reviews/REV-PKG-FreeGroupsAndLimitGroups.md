# Independent package review: FreeGroupsAndLimitGroups

**Verdict: accepted, with the corrections below applied in the package.** Claude, session `claude-aroFvz`, reviewed issue #9736 on 2026-10-14. I did none of the packaging job (#9735, Codex session `codex-3H3T14`, PR #9787). The files reviewed are `research/blueprint/packages/FreeGroupsAndLimitGroups/{README.md,Suggested.lean,metadata.toml}`, checked against the accepted plan `research/blueprint/packets/FreeGroupsAndLimitGroups.json`. This review checks a plan. It does not claim that anything is formalised.

The package is a careful one. Every Layer 1–11 statement I instantiated came out true, and so did every Check and Lean signature. The corrections the author made to the sources hold up against the sources themselves. The one structural defect is a duplication: malnormal subgroups are defined again although Tau Ceti already has them at the pin. That is fixed here. The other changes are locator, supplier and wording corrections.

## 1. Upstream form

I read the current upstream FuchsianOrbifolds and ClassifyingSpaces READMEs and Suggested.lean files, and UPSTREAM_GUIDE.md. The README has the upstream shape:
- an opening **Summary**;
- scope and ownership, then conventions;
- exact supplier contracts, then a build overview;
- eleven layers of numbered prose subsections, each closing with Examples and Dependencies;
- downstream consumers and references.

Every definition has its API list and a **Checks** list. Every theorem states its hypotheses and has a source locator and prerequisites. There are no target tables, field-list blocks, truncation markers or packet, job or review names. The scan for process words found only mathematical uses ("accepted subgroup", "the input word"). Two atlas-internal phrases were reworded ("No other roadmap of the atlas plans …", "Within the atlas, …").

## 2. Fidelity to the plan

A script compared the README with the packet's 126 nodes:
- **Subsections:** every node has a subsection.
- **Checks:** all 223 named Checks are present.
- **API names:** 290 of the 291 are present. The missing one is `Subgroup.IsMalnormal`, removed on purpose (section 3). Its subsection heading is now "CSA groups and commutation transitivity".

I compared four randomly sampled node statements with the README text: the solver's termination, Merzljakov's theorem, points as homomorphisms, and standard form. They agree. The README keeps the plan's hypotheses and adds the corrections listed in the package handoff. Its boundaries agree with the plan's.

## 3. Duplication against Tau Ceti and TauCetiRoadmap

I searched four things, by object and hypothesis as well as by name:
- TauCetiRoadmap at the local checkout `0d144d0`;
- TauCetiRoadmap main `70a1ff2` (2026-10-14), including ClassifyingSpaces, NoncommutativeGeometry and other roadmaps newer than the checkout;
- the current Tau Ceti library at `a91d3aaf`;
- the Tau Ceti f790474 / Mathlib 082e2d3 declaration index of the pinned baseline.

**Removed and cited instead:**
- **Malnormal subgroups (§1.18).** Tau Ceti at the pin has `TauCeti.IsTISubgroup` in TauCeti/GroupTheory/TrivialIntersection.lean. It is the trivial-intersection (malnormal) condition, stated elementwise, with the lattice form `TauCeti.isTISubgroup_iff_inf_conj_smul_eq_bot`. Its module docstring calls it malnormality. The package had re-planned this as `Subgroup.IsMalnormal`, and its supplier section said "No Tau Ceti declaration at the pin is required". Changes:
  - The definition target is removed.
  - CSA groups are now defined through `TauCeti.IsTISubgroup`.
  - The conventions fix "malnormal" to mean `TauCeti.IsTISubgroup`.
  - The scope and the "From Tau Ceti" contracts name both declarations and where they are used: §1.18, §1.19, and through CSA §5.5, §7.14 and Layer 8.
  - The scope also notes that `TauCeti.IsTISubgroup.centralizer_singleton_le` exists in the current library.
  - The CharacterTheory roadmap's Frobenius complements (Layer 8) use the same notion for finite groups; a note says so.
- **Abelian subgroups in the Lean file.** The home-made `IsCommSubgroup` is replaced by Mathlib's `IsMulCommutative`.

**Checked and not duplicates:**

| Item | Why it is not a duplicate |
| --- | --- |
| Residual finiteness of free groups | In the current library only (`FreeGroup.instResiduallyFinite`), and only a supplier here, not a target. The pin route through §5.8 is kept. |
| Schreier rank inequality | The current library's `Subgroup.rank_le_one_add_index_mul_rank_sub_one` is an inequality; the exact formula for free groups (§2.12) is new. |
| Free-group syllables, lower central series | Not used. |
| ProfiniteProPGroups | Pro-p Nielsen–Schreier and Hopficity. |
| GeometricTopology | JSJ of 3-manifolds, not of groups. |
| AlgebraicTopology, FuchsianOrbifolds | Topological and geometric surfaces. |
| ClassifyingSpaces | Presentation complexes; the wedge of circles as a K(F,1). A boundary note now says Layer 2's combinatorial fundamental group does not use it. |
| BelyiMaps | Consumes free groups, Nielsen classes. |

**Suppliers:**
- All 68 Mathlib supplier names exist at 082e2d3.
- Mathlib's free-group ping-pong lemma `FreeGroup.injective_lift_of_ping_pong` was missing from the contracts. It is added, with its hypotheses, and is now a supplier of §5.8, beside the CoprodI form and `freeGroupEquivCoprodI`.
- Two lemma names in proof sketches were inexact at the pin. Corrected to `FreeGroup.reduceCyclically.reduce_flatten_replicate` and `Primrec.list_findIdx`.

## 4. Gaps and tiers

FreeGroupsAndLimitGroups is not in the Caraiani–Newton tier list. Its only suppliers are Mathlib and Tau Ceti, so there are no upward citations, no `FoundationsAndLibraryIntegration` ids and no `UPSTREAM:` references.

Every prerequisite in the *Needs* lines points to Mathlib, Tau Ceti or an earlier subsection, with two exceptions. These are the declared cross-layer orders: §8.5–§8.6 before §6.8, and §8.7 before the finite-rank clause of §8.2. Both are acyclic.

The one recorded gap is kept, explicitly marked and unused by other targets: §10.10, constrained elimination over a represented limit group, which depends on KM06 Theorem 32.

## 5. Unit tests

Every definition and construction subsection has at least four Checks. Removing `Subgroup.IsMalnormal` removed no Check: the CSA subsection keeps five, including the non-commutative-transitive F₂ × ℤ and the proper-power amalgam. Lean keeps the negative control that ⟨a²⟩ is not malnormal.

Two Checks were sharpened:
- `GroupAlgGeom.rad_abelian` claimed that the radical depends on H, but varied G. It now also fixes G = F(a,b) and compares H = G with H = G × ℤ/2, where x = (1,1) solves x² = 1.
- `GTree.not_isQH_abelian` gave the χ(torus) reason, which covers only the trivial fiber. It now gives the general reason: quotients of ℤ² are abelian.

## 6. Suggested.lean

The original file passed `lean-check`: exit 0, 116 warnings, all `declaration uses sorry`. The corrected file passes too: exit 0, 114 warnings, all `declaration uses sorry`. It is 917 lines, imports `Mathlib` and `TauCeti.GroupTheory.TrivialIntersection`, and has no sorry'd data definitions.

Changes:
- `IsMalnormal` and `IsCommSubgroup` are removed. `IsCSA` and `zpowers_malnormal` now use `TauCeti.IsTISubgroup` and `IsMulCommutative`.
- Two examples that tested the removed `IsCommSubgroup` are dropped. The malnormality examples are restated with `TauCeti.IsTISubgroup`, and an unused hypothesis is removed.
- Docstrings now name the README declaration each Lean name stands for, where the names differ:

| Lean name | README name |
| --- | --- |
| `LabelledGraph`, `accepted` | `StallingsGraph`, `StallingsGraph.subgroup` |
| `groupLang` | `FirstOrder.Language.group` |
| `termToWord` | `Term.toWord` |
| `evalAt` | `GroupAlgGeom.eval` |
| `algSet` | `GroupAlgGeom.V` |
| `idealOf` | `GroupAlgGeom.I` |
| `radical` | `GroupAlgGeom.Rad` |
| `CoordGroup` | `GroupAlgGeom.coordGroup` |
| the surface groups | `SurfaceGroup.orientable`, `SurfaceGroup.nonorientable` |
| `CentralizerExt` | `LimitGroup.centralizerExt`, case n = 1 |
| `EncSystem` | `FreeGroup.EqIneqSystem`, encoded |

- The closing comment now also lists Dehn twists of amalgams and the reduction `GE`.

I checked more than ten signatures against the README, including:
- `exists_conjWitness`, `exists_maxRoot` and the CSA definitions;
- `rank_sub_one_eq_index_mul`, including n = 0;
- `exists_dehnTwist_hnn`, against Mathlib's convention t a t⁻¹ = φ a;
- `isIrreducible_iff_discriminated`, `exists_solver` and `merzljakov`;
- `IsLimitGroup`, with markings in F₂;
- `isFullyResiduallyFree_centralizerExt` (true for abelian G as well);
- the doubled Gromov product of `LyndonLength`;
- `hasLift_genusTwo`.

All have the README's hypotheses. None is vacuous, and there is no `True` or `Prop := sorry`. `metadata.toml` is `topic = "math.GR"`, which fits.

## 7. Adversarial mathematics pass

Each row gives the statements checked, the instances computed, and the result.

| Statements | Instances computed | Result |
| --- | --- | --- |
| §1.1–1.2, §1.8 conjugator | (ab)(b⁻¹a) = a², substitution of [a,b]; c = c₁ p c₂⁻¹ against Mathlib's conjugator orientation; conjWitness [] L; ab against b⁻¹a⁻¹ | Correct. `primrec_mk` used §1.2's reduce, so a note now orders it after §1.2. |
| §1.11–1.19 | Primitive elements a b and a b²; the commutator (not primitive, not a proper power); maxRoot at 1, (ab)², b a² b⁻¹; centralizers; ⟨a²⟩ not malnormal; CSA ⇒ commutative transitivity; subgroups of CSA groups | Correct. Malnormality now cited from Tau Ceti. |
| §2.1–2.14 | Rose, segment, double edge; folds of the flowers a b / a c and a / a; Γ([a², a³]); hanging-edge core; rank 3−2+1; the index-2 even-length subgroup has rank 3; ⟨a, bab⁻¹⟩ ∩ ⟨b⟩ = ⊥; α = ∅ in Schreier | Correct. The garbled type-graph sentence of §2.7(4) is rewritten. |
| §3.1–3.7 | Constant-free and coefficient sentences in F₂ and ℤ²; the DNF of ¬(x=a) ∨ (xy=yx); the universal sentence ∀x∀y [x,y]=1 | Correct. |
| §4.1–4.13 | BS(1,2) degree 1+2; ⟨x,y \| x²=y³⟩; Mathlib's HNN convention with e ↦ t⁻¹; translation lengths ℓ(ab) = 2 and ℓ(aba⁻¹) = 1; induced splitting of ⟨ab⟩ in ℤ∗ℤ; Grushko of ℤ²∗F₂; τ_zτ_w = τ_{zw} (amalgam and HNN), τ_aτ_b(c) = b a c a⁻¹ b⁻¹ in the variant; [a₁,b₁] = [b₂,a₂] | Correct. |
| §5.1–5.12 | Rad(x²) = ncl(x) over F₂; ℤ/2 and ℤ; F₂×ℤ/2 (new); V([x,a]) = ⟨a⟩; zero divisors in ℤ and F×F; T1 failing for G = 1, H = F₂; algebraic subsets of ℤ; restricted product; trace of the Sanov commutator = 18; Γ(⟨a⟩∪⟨b⟩) is not CSA | Correct; the H-dependence witness was added. |
| §6.1–6.10 | Abelianisations; disc, sphere, ℝP², torus, Klein bottle, pants; double covers (χ multiplies); Klein relator x y x y⁻¹; general position of the genus-3 solution, computed ([a,b][b,a²] = [a⁻¹ba, a]); IFT Definition 6 and Theorem 2 on p. 9 read against the package's corrections; the radicals of x₁²x₂² and x₁²x₂²x₃²; ℤ² not QH | Correct; the QH reasoning was strengthened. Both IFT corrections are confirmed in the source: the "equivalent" κ-form omits [x₁,y₁][x₂,y₂] = 1, and Theorem 2(4)–(5) print only commutators, which do not contain the equation. |
| §7.1–7.16 | Fig. 2 equations on IFT p. 18; graphical against group solutions; x² = a; [x,y] = [a,b]; the centre system; constrained y² = a²; Malcev's equation on IFT p. 11; positiveDecide with ∀x∃y y² = x | Correct. |
| §8.1–8.9 | F₂×ℤ; ℤⁿ; ℤ/2; S⁻(3,0) by Lyndon; ℤ² marked limits; the F = ⟨a², b⟩ negative control (unique roots); centralizer extensions with n = 0; the proper-power amalgam; [x,y] = a degenerate | Correct. The definition now admits n = 0, which a Check uses. |
| §9.1–9.7 | Lyndon axioms on ℤ/2; l ≡ 0; lexicographic ℤ²; a cycle of length 4 (fails T3); the reflection n ↦ 1−n; the undefined product in R(ℤ[t], {a,b}); a^{t+1} ∉ ⟨a^t⟩ | Correct. |
| §10.1–10.10 | Outer space for F₂; the S⁺(2,0) point tree; the relative example F(a,b) ∗ F(x,y) (free of rank 3 without ℋ); conjugacy in ℤ²∗ℤ; isMono of x ↦ a², y ↦ b²; the [x,a] MR diagram with twists; the inconsistent x² = a | Correct. The conjugator direction is now stated (t⁻¹ in the c⁻¹xc convention). |
| §11.1–11.9 | x = z² ∨ y = z² ∨ xy = z² over ℤ² (parity; no lift in F∗ℤ²); K(m,n) against IFT p. 68 and p. 136 (m+2, m+4n+2); [z,x₁] = 1 ∧ z ≠ 1 compatible; y² = x₁ incompatible; the two-level regular NTQ example and the degenerate one | Correct. A self-reference in §11.7 was removed. |

## 8. Sources

I read the public PDFs: FOLD, KM02, ALG, VAR-I, VAR-II, RECOMP, LIMITS, GL-JSJ, JSJ, SUBGROUPS, LENGTH, KMS-ACTIONS, MRS-REGULAR, IFT, LIFT and SELA-I (Numdam). About 200 locators were looked up. Three Haiku helpers located the numbered items, and I re-read every reported discrepancy and every locator a correction rests on:
- IFT pp. 8–9, 11, 18, 68 and 136;
- ALG p. 32;
- GL-JSJ pp. 25–26, 91 and 97;
- JSJ pp. 121, 132 and 186;
- LIMITS pp. 4, 22, 45 and 48.

Corrections:
- **LIMITS (§8.4).** "Propositions 3.10, 5.1, 6.5, 6.6" now reads Corollary 3.10, Theorem 5.1, Corollary 6.5 and Proposition 6.6. LIMITS's own introduction calls them propositions.
- **GL-JSJ (§4.12).** Remark 2.13 is on p. 26, not p. 25.
- **JSJ and LIFT references.** The pages cited are journal pages printed in the arXiv running heads: JSJ = PDF + 86, LIFT = PDF + 212. The JSJ entry wrongly said "PDF pages cited", and the LIFT entry gave no page basis. Both now say journal pages.
- **LIFT.** "§1" now reads "Introduction"; LIFT's introduction is unnumbered.

One helper report was wrong and needed no change: it put JSJ Lemma 4.7 on p. 134, but the lemma is stated on printed p. 132, as the package says. All other sampled locators matched. That includes every KM02, FOLD, VAR-I, VAR-II, LENGTH, KMS-ACTIONS, MRS-REGULAR, SUBGROUPS and SELA-I locator checked, and the GL-JSJ Theorem 9.5 hypotheses: finitely generated, torsion-free, CSA, freely indecomposable relative to ℋ.

Locators flagged by the author as unverified:
- **MAK and MAK82** (Math-Net.ru). The full-text download stalled again in this run, at 25 KB of 1.5 MB. I could not re-check the translation's printed pages myself. The accepted plan's review records reading both in the Math-Net.ru English translations, so the statements were checked. The page-level locators remain as inherited.
- **TREES** (Serre, not freely available). The chapter locators stay marked supplementary and unverified in the references, and every target citing them also cites a public source.
- **INFINITE-WORDS.** Supplementary, cited for context only.
- **KM06.** Under the §10.10 gap.

No source passage or section summary was added. The new text is in my own words.

## 9. Intake

`python3 research/blueprint/intake.py check-files` on the five files returns 0 problems. There are no local paths.

## What remains (not defects of this package)

- **§10.10.** The represented-limit-group solver remains a recorded gap.
- **Handoff follow-ups.** The package handoff's follow-ups stand: the lemma-level §6.4 cut-and-paste, the §7.6 Makanin bound, Layer 10's split into implementation units, §11.4 Nielsen-property details, and LIFT's liftability decision.
- **Errata, for the maintainer.** IFT Theorem 2(4)–(5), p. 9 (arXiv v2), prints the radicals of x₁²x₂² and x₁²x₂²x₃² as normal closures of commutators alone. Those do not contain the equation: x₁ = x₂ = a satisfies [x₁,x₂] = 1 but not x₁²x₂² = 1. The package states the correct radicals, ncl(x₁x₂) and ncl(x₁x₂x₃, [xᵢ,xⱼ]). This error is not among the packet's source issues E1–E3 and is a candidate for the register of mistakes in published sources.
