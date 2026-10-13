# Review: CrystallineCohomology roadmap package

**Verdict: accepted after fixes.** Reviewer: Codex, session `codex-ZD7Hsx`,
2026-10-13; job #9207. I did not write PKG-CrystallineCohomology (#8890).
The package is ready for the maintainer's draft TauCetiRoadmap pull request.
This accepts a mathematical specification, not implemented crystalline theory.

## Scope and fidelity

I read WORKERS.md, PACKAGE_REVIEW.md, the blueprint and expansion protocols,
UPSTREAM_GUIDE.md, the complete issue, both accepted input packets and the
package handoff. The form comparisons were AdicSpaces and JacobianChallenge;
the current AdicSpaces and ProfiniteArithmetic suggested files supplied the
compact Lean models. The README retains its Summary, ownership boundaries,
conventions, exact supplier contracts, ordered layers, APIs, Checks, examples,
dependencies and references. `metadata.toml` remains `topic = "math.AG"`.

All 274 packet targets are present, together with the two tier-resolution
targets added by the packager. I read all target statements and hypotheses and
all 276 target-level Checks blocks. Every one of the 127 packet definitions or
constructions has at least three Checks; their examples were assessed for what
an incorrect definition would get wrong, rather than merely counted. The
mechanical title and definition inventory was an additional check. The five CR.7 title
changes retain their mathematical subjects:

| Packet title | Package title |
| --- | --- |
| Finite projective coefficient interfaces | Finite projective crystalline coefficients |
| Filtered arithmetic coefficient interfaces | Filtered Frobenius coefficients on semistable models |
| Dieudonné crystal evaluation interfaces | The crystalline Dieudonné crystal of a Barsotti–Tate group |
| Grothendieck–Messing filtration interfaces | Grothendieck–Messing deformation theory |
| Relative crystalline direct image interfaces | Relative crystalline direct images |

The input-stage inventory below includes targets whose dependency order places
them in another README layer. The topology comparison is after embedding
computation in CR.2; the two log-Witt/tube constructions are in CR.6.

| Input stage | Targets | Definitions/constructions |
| --- | ---: | ---: |
| CR.0 | 58 | 22 |
| CR.1 | 15 | 11 |
| CR.2 | 12 | 3 |
| CR.3 | 15 | 3 |
| CR.3:Frobenius-isogeny | 2 | 0 |
| CR.4 | 79 | 29 |
| CR.3:duality | 5 | 4 |
| CR.5:log-algebra | 27 | 22 |
| CR.5 | 24 | 17 |
| CR.6 | 27 | 11 |
| CR.7 | 10 | 5 |

The 45 recorded plan obligations remain explicit work inside named targets,
including the omitted Stacks verifications, general slope classification,
projective-space computations, finite syntomic trace and trace/product
compatibility. They are not asserted as existing library theorems. The tier-9
bundle imports DerivedDeRhamCohomology and lower-tier suppliers. There is no
`FoundationsAndLibraryIntegration`, `UPSTREAM:` identifier or higher-tier
roadmap citation in the final README.

## Corrections and adversarial mathematics pass

The pass covered the defining properties, theorem hypotheses, identities,
map directions and conventions throughout the inventory above. The following
table records the instances used and the material corrections. Unchanged
rows record the restrictions that prevent a stronger, false statement.

| Statements checked | Instances and calculation | Result |
| --- | --- | --- |
| CR.0 additive candidates, gluing and scalar extension | Degree 0, empty lists, zero ideal, identical ideals, square-zero ideals and nonflat quotient of F₂⟨t⟩; the mixed quadratic coefficient is 1 | Retained totalization outside the ideal and flatness for arbitrary ideal extension; principal extension has its separate hypotheses |
| CR.0 augmentation, weighted filtration and nilpotence | F⁰(0)=R; Fⁿ(0)=0 for n>0; γ₂(2)=2 in ℤ₂ and ℤ/4; degree-two divided monomial in characteristic 2 | Retained all positive-degree generators and distinguished PD nilpotence from ordinary nilpotence |
| CR.0 canonical powers, compatibility, envelopes and completions | p=2, n=0, characteristic p, torsion quotient, identity envelope and zero ideal | Kept the prime-to-p unit condition, universal-map domain, common PD extension, and derived completion hypotheses |
| CR.1 sites and coefficient topology | Frobenius F_p[t]→F_p[s] is finite free of rank p but not étale; μ_p has section 1+ε on the dual numbers | Added the big fppf crystalline topology needed by the Dieudonné internal Ext; group sections are G(U), while structure sections are O(T) |
| CR.1 compatible-base variants | Identity object on Spec ℤ/p²; ordinary closed-fibre W_n(k) object; conflicting δ₂(2)=0 in ℤ/4 | Added compatible Zariski, étale and big fppf variants, with common powers on J+IO_T, APIs and discriminating tests; p-nilpotent X need not factor through V(I) |
| CR.1 connections, stratifications and topology comparison | Structure and zero crystals, square-zero diagonal, identity base map, characteristic-p Taylor operators | Retained integrability and quasi-nilpotence and the quasi-coherent coefficient restriction on change of topology |
| CR.2 Poincaré and embedding computation | Identity smooth lift, point, affine line, two embeddings and finite PD levels | Kept PD rather than ordinary differential identities, embedding refinement and filtered comparison hypotheses |
| CR.3 descent, base change, perfectness and Frobenius | Point, projective line, two components, characteristic-p Frobenius and torsion coefficients | Retained the actual derived base-change arrow, finite-level/perfectness conditions and distinction between Frobenius isogeny and integral invertibility |
| CR.4 Dieudonné complexes, saturation and V-filtration | Zero differential, zero complex, r=0, p-torsion, FV=p and FdV=d | Kept termwise p-torsion-freeness, the graded (not chain-map) Frobenius, and image V^r plus image dV^r |
| CR.4 Witt inputs, relative/classical/saturated comparisons | W₁, perfect field, polynomial and Laurent variables, nonreduced F_p[ε]/ε², p=2 | Kept the ℤ_(p)-algebra and F_p scopes separate, the conditional Langer–Zink étale result and the independently proved general Witt result |
| CR.3:duality trace, cup products and diagonal | P⁰, P¹, P²; cup sign −1 in bidegrees (1,1); product dimensions d,e; W(F₂) | Fixed the Čech differential/product convention and ε_d=(−1)^(d(d−1)/2); h²=−[dlog t₁∧dlog t₂] and normalized trace is 1; added computed Lean signs |
| CR.5:log-algebra integral/fine/saturated/Kummer notions | ℕ, cusp monoid ⟨2,3⟩, n=0, p-th-root chart, characteristic 2 | Added integral-monoid Lean binders to Kummer; required n≥1 in the root test and proved the zero-power map is not Kummer |
| Log-ring predicate | Chart n↦(−1)^n: distinct 0 and 2 both map to the unit 1, also in characteristic 2 | Replaced the false infinite-order explanation and removed the characteristic-2 escape clause; pinned the collision in Lean |
| Log PD smoothness | Identity thickening of F₃[x]/x² tested against F₃[t]/t²⊂F₃[t]/t³; every lift of x has square t²≠0 | Replaced a description of coordinate data by a genuine nonsmooth negative control |
| Log crystals | O_U on (X,Spec F_p[ε]/ε²)→(X,X): B⊗_{F_p}F_p→F_p has kernel (ε) | Replaced the tautological non-example and fixed the direction of the thickening morphism |
| Log PD stratifications | Rank-one map 1+γ₂(ξ) over F₃; the triple cocycle has missing cross term ξη modulo PD degree 3 | Replaced a tautological cocycle warning by a computed failure |
| Log quasi-nilpotence | λ=[a] in W(F₄), a²+a+1=0; every λ−j is a unit | Replaced residue 1/2, which was outside the integral carrier, with a valid integral non-example at p=2 |
| CR.5 log Poincaré, Cartier and A_cris charts | Trivial log structure, log point, normal-crossing chart and characteristic p | Retained Cartier-type and log-smooth hypotheses, exactification and the stated compatible base powers |
| CR.6 integral HK | Relative log point, good-reduction P¹ and two points; H²(P¹)=W(k)(−1), φ=pσ | Replaced a noncomputed torsion warning with integral computations that fail after premature rationalization |
| CR.6 θ triangle and Nφ=pφN | Two-term x↦dx; d on C[−1] is −d; φ(a,b)=(a,2b), N(a,b)=(b,0) | Replaced raw right wedge by ι_θ^q(a)=(−1)^(q−1)a∧θ=θ∧a; supplied the chain-map witness and direction/reversed-direction Lean examples |
| CR.6 nilpotence and twists | Zero space, two-dimensional Tate block, noninvertible φ and r=0 | Kept finite dimension and invertible semilinear φ; twists scale φ by p^(−r) and shift Fil by r |
| Unit logarithm and uniformizer change | log_Q3(4) has valuation 1 and log(4)/3 has residue 1; unit valuation is zero | Added a nonzero unit-log computation and imported Mathlib's general Teichmüller representatives rather than rebuilding them |
| CR.6 tube support and limits | Two smooth components with support on the first: K₀²→K₀ has kernel K₀⊕0; cofinal exhaustion | Replaced a noncomputed support-order claim with this kernel calculation; kept dagger, strict-limit and completed-tensor hypotheses |
| CR.7 Dieudonné and Grothendieck–Messing | Q_p/Z_p, μ_{p∞}, general p-nilpotent base, abelian lift | Specified internal Ext in the compatible big fppf topos; F,V via absolute Frobenius only in characteristic p; corrected contravariant D(G)=Lie E(G)^∨ and the Hodge quotient Lie(G∨) |
| CR.7 relative evaluation and base change | Identity morphism, nonaffine T, and V=Spec F_p inside T=Spec ℤ/p² where no T→Y exists | Evaluation is sheaf-valued Rπ_(X_V/T♯),*F; RΓ is derived sections, not the sheaf itself; X_V replaces the undefined X×_Y T |
| CR.7 Gauss–Manin and horizontality | Locally free cohomology with cohomology base change, trivial family and PD diagonal | Obtained connection/horizontality from the derived crystal and stratification equivalence; kept the extra cohomology hypotheses and made boundary identification part of the target |

The new site variants share the common-extension test and its three independent
examples. Their covers also have the non-étale Frobenius and group/structure
sheaf tests. All new mathematical carriers stay in the README.

## Source checks

The random sample was drawn reproducibly from the 274 nodes with seed 9207.
I opened the source at each main locator and read the relevant statement and
argument; the source check was independent of the packet's claimed match.
Stacks numbers refer to the source at commit
`a04446e57ec1fbc252a871afcec7752fb2807b14`.

| Sample target | Source checked | Outcome |
| --- | --- | --- |
| Inverse image log structures | Kato §1.4, pp.193–194, (1.4.1)–(1.4.2) | Pullback is the associated log structure, not the raw inverse image |
| Existence/uniqueness of glued powers | Stacks 23.2.5, 07GQ, statement and proof | Agreement on the intersection and uniqueness match |
| Flat-extension base map | Stacks 23.4.1–23.4.2, 07H0–07H1 | PD morphism condition and flat extension match |
| PD stratifications | Stacks §60.17, D(n), Lemmas 60.17.1–60.17.3 | Double/triple diagonal and quasi-nilpotent Taylor construction match |
| Additive divided-power candidates | Stacks 23.2.4, 07GP, with 23.2.1, 07GL | Multiplication/iteration are separate generator hypotheses; totalization is the Mathlib variant |
| Étale extension of envelopes | Stacks 60.2.6, 07HD, and flat extension | Base change and étale extension match |
| Relative Witt forms over perfectoid bases | BMS §10.5, Proposition 10.14, p.85; Lemma 3.13, p.24; Remark 3.19, p.26; Theorem 10.4, p.81 | Perfectoid reduction and finite Witt scalar extension match |
| Witt localization and étale descent | Langer–Zink Propositions 1.7–1.9, pp.23–27; BMS Lemma 10.8, pp.81–82; BLM §§5.1–5.5, pp.55–68 | Conditional Langer–Zink statement is not silently strengthened; the separate general proof is identified |
| PD versus ordinary nilpotence | Stacks 60.5.2, 07HM; before 60.7.5, 07MF; 23.2.6, 07GR | ℤ/4 and augmentation counterexamples match the distinct notions |
| Laurent weights/integral part | BMS Theorems 10.12–10.13 and proofs, pp.83–85 | Laurent extension and integral-weight quasi-isomorphism match |
| V-filtration representatives | BLM Construction 2.5.1, p.19 | Both im V^r and im dV^r are required |
| Finite Witt perfectoid input | BMS Definition 3.5, p.21; Lemmas 3.10–3.13, pp.22–24; Remark 3.19, p.26 | Perfectoid and finite-level hypotheses match |
| Change of topology for crystals | Stacks 59.22.4; 60.17.2–60.17.3; 60.21.1 | The module-topology theorem is supplemented by the crystalline connection/embedding argument |
| Polynomial basic Witt expansion | Langer–Zink §2.2, pp.37–42; Theorem 2.8, p.43; Proposition 2.17 and Corollary 2.18, pp.55–57 | Finite-level existence/uniqueness uses the ℤ_(p)-algebra scope; extra torsion-free hypotheses are not imposed on the final statement |
| Weighted PD filtration | Stacks §60.6, between 60.6.2 and 60.6.3 | Empty product gives the n=0 convention |

I also checked every book locator flagged by the packager, using permitted
public replacements or the actual supplying roadmap. Messing, BBM, Demazure,
Serre and Berthelot–Ogus were not read in an original book copy: none is
cleared by the supplied library index. They are not silently treated as read.

- **Messing V.1.6:** the statement and its admissibility condition are recorded
  in Panny–Robert–Sferlazza, Appendix B, p.35 (28 September 2026 author PDF).
  Illusie, *Grothendieck and the theory of crystals*, §4.2(v), pp.17–18,
  supplies the p-nilpotent and locally PD-nilpotent scope. De Jong 3.2.1,
  pp.32–34, was checked without extending its more restrictive formal-base
  statement by itself to every base.
- **BBM 3.3.6/3.3.10:** their historical citation is explicitly attributed to
  de Jong §2.3.3, pp.21–22. The usable general-base Ext and Hodge sequence
  are sourced to Panny–Robert–Sferlazza, Appendix B, pp.35–36, which cites
  BBM 3.3.3 and 3.3.5. Madapusi–Mondal, Remark 4.3.3, pp.13–14, fixes the
  fppf topology. The added topology is a required input, not a claimed
  invariance of arbitrary Ext under a topology change.
- **Abelian realization:** read AbelianSchemesAndArithmeticModuli §A4.6
  and its PD-nilpotent restriction, and the public comparison in
  Panny–Robert–Sferlazza, Appendix B, p.36. Corrected the universal-extension
  variance using Illusie §4.2(iv), pp.16–17.
- **Demazure III.8:** replaced the operative citation with Scholze–Weinstein,
  *Berkeley lectures*, Lecture 12, printed p.99, footnote 1 (March 2020),
  and Illusie §2.2, pp.3–5. The former explicitly gives the duality between
  their covariant normalization and the contravariant one used here.
- **Serre II §4, Proposition 8:** removed this operative citation and the
  duplicate Teichmüller construction. The pinned Mathlib statements provide
  the general perfect-residue-field input directly. Hyodo–Kato §5.5,
  pp.265–266, remains the source for the unit-logarithm comparison.
- **Berthelot–Ogus:** read Ogus's official 21 August 2013 Appendix B erratum,
  pp.1–2. The package retains the corrected derived isomorphism and the
  surjectivity restriction for (B2.1a), rather than assuming an actual
  chain-level lift. Replaced the unchecked relative-cohomology book locators
  with Du–Moon–Shimizu, Lemma 5.9, pp.13–14; Theorems 8.1–8.2, pp.31–35;
  Theorem 9.1/Proposition 9.2, pp.35–38; and Theorems 10.11–10.13,
  pp.43–44. I read these statements and their relevant proofs in
  arXiv:2603.00559v1, using their trivial-log specialization. The sheaf-valued
  evaluation and sub-PD-ideal base convention are explicit there.

Public versions used include BLM arXiv:1805.05501v3, the July 2003 Langer–Zink
author manuscript (PDF page = printed page + 1), the Numdam Hyodo–Kato scan,
and the author PDFs of Illusie, Madapusi–Mondal and Panny–Robert–Sferlazza.
For the random BMS sample I read the maintainer-cleared January 2019 text;
no restricted file or passage was copied into the repository or scratch.
Additional cleared-source readings used the Berkeley lectures. All new text
is in my own words with locators; there are no source excerpts or sequential
summaries of source sections.

For reproducibility, the public replacements with changed operative citations
have these SHA-256 values:

| Source | SHA-256 |
| --- | --- |
| [Illusie author PDF](https://www.imo.universite-paris-saclay.fr/~luc.illusie/Illusie-Pisa5.pdf) | `b3861de7e9c0584a7da44e514fbc777b168a3f67f392e2468db655f2d5b58d7d` |
| [Panny–Robert–Sferlazza author PDF](https://www.math.u-bordeaux.fr/~damienrobert/pro/publications/articles/lifting_traces.pdf) | `2b7df997e5a2122be65f5f64b30b4c6ff5157763402e50a39478ebd62377fbdd` |
| [Madapusi–Mondal author PDF](https://www.keerthimadapusi.com/assets/preprints/fflat.pdf) | `27d5e77f6a70cdf88da66026d94889beebd996fe63ddeb1dfd2f583eba6a4c34` |
| [Du–Moon–Shimizu v1](https://arxiv.org/pdf/2603.00559v1) | `0bb47e76f17bc6f564a8273fc25a3f74d7ed87dfbb87fc6fcf89372518cf6e77` |
| [Official Berthelot–Ogus erratum](https://math.berkeley.edu/~ogus/preprints/BO_B2_Erratumre.pdf) | `7a31ee9881433d3db283bbfcdfbba23e39e53acd919d9230a054cc3c3bc8fc0a` |

## Current-library and roadmap duplication audit

The read-only upstream roadmap checkout was
`0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I searched the current roadmaps'
README/Suggested files and the Completed tree by objects, operators, carrier
fields and hypotheses: PD ideals/envelopes, Kähler/exterior differentials,
de Rham complexes, Witt F/V/truncation, crystalline coefficients and
thickenings, Frobenius-semilinear modules, logarithmic monoids/differentials,
monodromy, traces and graded products. This included all nine roadmaps newer
than the atlas snapshot and Completed ContourIntegration, EffectiveBounds,
OrthogonalL2Bases and RestrictedProducts. I read the relevant hits rather
than treating an absent target-name match as evidence.

The reviewed library-coverage audit has no CrystallineCohomology record;
it therefore supplied no independent completeness certificate. I read local
pinned declaration statements for the package baseline and the interfaces
used in the overlap decisions, with Mathlib at
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti at
`f790474821cf4256814db967cb154e7af3d0c369`. Current-head declarations were
checked separately and were not used to justify a pinned Lean carrier.

**Removal in this review:** the construction of perfect-residue-field
Teichmüller lifts in the unit-logarithm target is removed. Mathlib's
`RingTheory/Teichmuller.lean` already has `Perfection.teichmuller₀`,
`mk_teichmuller₀` and the compatible-lift uniqueness statement;
`(PerfectionMap.id p k).equiv` supplies k→Perfection k p. The package
imports this contract in its boundaries/suppliers. It retains only the
unit logarithm and its comparison uses. There is no removed-target stub.

Other overlap decisions:

- Existing divided power structures, maps, quotient structures and
  `DividedPowerAlgebra` remain imports; the augmentation PD structure and
  envelopes are additional targets, not second copies of these objects.
- IntegralHeckeAndGaloisDeterminants §0.4 and §6.4 supply Γ grading/base change
  and the regular-sequence Koszul complex. Current Tau Ceti's Koszul tensor
  sign automorphism is graded sign infrastructure, not that complex.
- DifferentialGeometry Layers 6/8 concern smooth real manifold forms and
  their de Rham complex; the algebraic PD/log/Witt complexes here have
  different carriers and differentials. Cartan–Dieudonné in
  OrthogonalSpinGroups is unrelated to Dieudonné crystals.
- Current Tau Ceti's Witt completeness and Frobenius/Teichmüller lemmas and
  the finite-residue local-field representatives remain imports. The
  nontrivial Witt algebra/tower and crystalline targets add stated content.
- The one-dimensional Mathlib isocrystal classification remains the
  boundary input; the general rational slope classification is the new
  target. ModularCurves' particular elliptic p-divisible/deformation
  interfaces do not replace the general p-nilpotent-base Dieudonné crystal.
- Generic derived and sheaf machinery is imported. This review does not
  alter the supplier-level DerivedDeRhamCohomology/EnhancedDerivedSheaves
  completion ownership note recorded by the packager; CrystallineCohomology
  plans neither generic completion nor a generic Koszul complex.

No further complete target duplicate was found in the current trees.

## Lean comparison and validation

`Suggested.lean` is 594 lines, imports only Mathlib, and contains no sorry'd
data definition, empty proposition carrier or implementation of a heavy
site/cohomology object. The closing comment now explicitly names every
README definition/construction, including the site variants and the two
tier-resolution additions. The new library `#check`s pin declarations.

Ten representative signatures were compared with the final README:

| Lean declaration | Hypotheses/design checked |
| --- | --- |
| `PD.AdditivePowers` | Total operations, vanishing outside I, and exactly the additive/homogeneity axioms |
| `PD.exists_dividedPowers_of_generators` | Ideal span, both generator identities, n≠0 in iteration |
| `PD.exists_dividedPowers_sup_iff` | Agreement on I∩J; both restrictions of the common structure |
| `PD.existsUnique_dividedPowers_map_of_flat` | Flat A-algebra, ideal map and actual PD morphism |
| `PD.exists_dividedPowers_span_p` | Prime p, every prime-to-p integer a unit, possible p-torsion; n=0 coefficient is 1 |
| `PD.pdFiltration` | Finite weighted products, total weight ≥n and the empty product |
| `PD.IsPDNilpotent` | Positive filtration bound, stronger than ordinary nilpotence |
| `PD.IsCompatibleWith` | Common structure on J+IB, without assuming IB⊂J |
| `LogCrystalline.IsKummerHom` | Integral source/target, injectivity and a positive power in the image |
| `LogCrystalline.PhiNModule.N_pow_finrank_eq_zero` | Perfect characteristic-p field, invertible semilinear Frobenius, finite dimension and Nφ=pφN |

The final `lean-check` exited 0 with 28 warnings, all `declaration uses sorry`.
It checks elaboration at the pinned Mathlib, not truth of the sorry'd
milestones. The proved new examples check the Čech signs, the zero-power
Kummer failure, the characteristic-2 unit collision, the shifted-complex
coefficient and the direction of Nφ=pφN. The mathematical counterexamples
on heavy carriers are the README Checks, not invented Lean stand-ins.

Both unchanged input packets pass `scripts/check_blueprint.py` with
0 errors and 0 warnings. `git diff --check` passes. The final intake
`check-files` run on all five allowed deliverables reports
`5 file(s), 0 problem(s)` and exits 0.

## Handoff and remaining work

This report is the handoff for #9207; its allowed deliverables do not include
a separate handoff file. No packet or other roadmap was edited. No in-scope
defect remains that requires sending the package back.

Downstream supplier moves in the original package handoff still apply:
PadicDifferentialEquationsAndRigidCohomology imports log rigid HK here;
FiniteFlatGroupsAndIntegralPadicHodgeTheory imports the general Dieudonné/GM
targets; PadicHodgeTheory imports the unit logarithm, not a new Teichmüller
construction; AInfCohomology imports the p-décalage specialization; and
LefschetzPencilsAndVanishingCycles imports classical Abhyankar. Point CR.7
consumers to the compatible big fppf definition of D(G), with the
characteristic-p restriction on its absolute-Frobenius F,V formulation.
Relative-cohomology consumers must preserve the sheaf-valued evaluation
and cohomology-level base-change hypotheses.

Original restricted-book locator numbers are historical attributions checked
through the named public alternatives, not assertions of a first-hand book
reading. A later contributor proving those targets should use the operative
references and the corrected hypotheses. The maintainer's independent
upstream mathematical gate and the subsequent formalization remain to be
done. Scratch downloads and logs are disposable; nothing needed by the next
worker is stored only there.
