# PKG-HigherLocalFieldsAndHigherClassFieldTheory

Completed package for issue #10771 by Codex, session `codex-Q7PvOA`,
20 October 2026. Claim confirmed by the claim bot in comment 6281767445.
Branch: `codex-Q7PvOA-higher-local-fields`.

## Deliverables and completeness

The package comprises `README.md`, `Suggested.lean` and `metadata.toml` in
`research/blueprint/packages/HigherLocalFieldsAndHigherClassFieldTheory/`.
The README gives all eight layers in mathematical prose, every target's
hypotheses, sources and prerequisites, all 139 intended API names, all
101 accepted definition/construction checks, and the worked computations.
Each layer ends with examples and dependencies. The closing comparison
layer states actual equalities and diagrams on common carriers.
`metadata.toml` is exactly `topic = "math.NT"` with a final newline.

| Accepted layer | Targets | API names | Definition/construction checks |
| --- | ---: | ---: | ---: |
| HL.0 | 30 | 42 | 31 |
| HL.1 | 7 | 12 | 9 |
| HL.2 | 11 | 8 | 6 |
| HL.3 | 7 | 14 | 9 |
| HL.4 | 6 | 20 | 15 |
| HL.5 | 8 | 18 | 13 |
| HL.6 | 12 | 25 | 18 |
| HL.7 | 4 | 0 | 0 |
| Total | 85 | 139 | 101 |

The accepted plan is the source of truth. Related targets are grouped into
prose subsections without removing their statements. The table below maps
every accepted node to its subsection and records its adversarial check.
Additional negative controls clarify dimensions zero, the terminal residue
condition, topology comparisons, denominator locations and characteristic two.
The package changes no packet, input reader, original suggested file, atlas
entry or other job's file. It is a completed package, not a checkpoint or a
claim that the proposed mathematics has been formalised. All eight input
stages remain planned, with their 15 explicit mathematical gaps.

## Libraries, ownership and upstream audit

Read the complete current LocalFieldsRamification and Completed/RestrictedProducts
READMEs, their representative suggested forms, the AdicSpaces suggested form,
and the relevant ClassFieldTheory, GlobalNumberFields and ProfiniteCohomology
supplier layers. The current upstream checkout inspected was commit
`0d144d044dacebca17b654695b6f1ad58f159b27`; the current Tau Ceti library was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Both were read only.

Checked the reviewed `data/library-coverage.json` audit for HL.0–HL.7 and
read the statements of all 45 accepted baseline declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. In particular, native Laurent
completeness concerns the outer valuation, not the higher topology; the
coefficient/valuation bridge has the `exp(−D)` sign. Filter-basis and
nonarchimedean subgroup machinery are used with their actual carriers.

The nine newer upstream directions were searched by mathematical objects
and hypotheses, including OperatorTheory's subdirectory suggestions, and
the four Completed directions were checked. Current-library searches covered
residue towers, iterated and mixed series, coefficient boxes, logarithmic
Witt forms, Milnor groups, Kato groups and complexes, reciprocity,
Parshin chains, higher adeles, Wiesend groups and refined ramification.
No kept higher-field target was found implemented there. Ordinary local
Artin maps, Tate duality, ramification, profinite arithmetic, continuous
cohomology and restricted products are boundaries, not duplicate targets.
No target removal or move-down was necessary. The HL roadmap is not one of
the 94 directions assigned a tier in `upstream/CaraianiNewton.md`; no tier
or bundle membership has been invented for it.

Two nearby current-library constructions were inspected directly:
`TauCeti/RingTheory/Huber/LaurentSeries.lean` proves the outer adic Tate-ring
example, and `Restricted/TwoSidedSeries/Basic.lean` requires coefficient
decay in both directions. They do not implement the higher topology or
`E{{T}}` (whose positive coefficients need not decay). These distinctions
are stated in the README's ownership section.

The 27 accepted requests are retained as exact contracts, grouped as follows:

- CR.4: finite-length ordinary/relative log-Witt carriers, Cartier, dlog,
  restriction/Verschiebung, traces and residues for imperfect fields.
- EDC.2 `trace-purity` and EDC.3: étale homology field stalks, localization,
  niveau differentials and the separately qualified wild purity comparisons.
- FA.2: curve ideles and degree; FA.3/FA.4's existing Artin–Schreier–Witt,
  equal-characteristic existence and Schmid–Witt comparisons are also imported.
- K2 T.3 and the exact T.2/T.4 nodes: graded Milnor carriers, localization,
  transfers, complete norm/residue and proper-curve reciprocity.
- KLF L.3: ordinary Hilbert/K₂ computations; L.5: its actual perfect-residue
  odd-prime scope, with an explicit request for the missing broader theorem.
- MEK KU: invertible-coefficient norm-residue; M.5d: prime-power, colimit,
  inseparable and characteristic reduction, without assigning BGK to it.
- SF.0, SF.2, SF.4 and SF.5: coherent/quasi-coherent completion control,
  field étale/Galois comparison, Nisnevich points and finite-étale fundamental
  groups, geometric resolution carriers, cycles and branch specialization.
- CFT Layers 5–8 and 10–12: ordinary local invariant/duality, finite and
  absolute Artin maps, existence and number-field global reciprocity.
- GNF Layer 6: number-field ideles and diagonal, with archimedean factors
  separately supplied when needed.
- LFR Layers 0 and 3: one-local extensions and ordinary ramification.
- PC Layers 1 and 10–12: canonical cohomology, transfer, dimension and cups.

`PrimeToDegreeAlterations` is a separately requested supplier direction,
not an existing campaign README: no such file exists in this checkout.
The package gives its precise degree-prime-to-ℓ/descent contract and the
Jannsen locators, without a fabricated link or claiming ordinary SF.4
alterations already satisfy it. Its assignment remains part of G13.

## Corrections and clarifications made while packaging

1. The rank-ring localization/unit formulas use ranks `n+1−i` and `n−i`.
   The tame symbol uses the valuation exponents and the last-uniformizer
   sign. For units u,v it is `(−1)^(rs) ū^s v̄^(−r)` on
   `{uπ^r,vπ^s}`. These retain the accepted E7/E10 corrections.
2. The mixed classification proof uses the residue superscript `n−r`
   and names the constructed standard subfield, retaining E8. In
   characteristic zero Teichmüller representatives are multiplicative,
   not an additive subfield; `ℚ_3` supplies the negative control (E1).
3. Finite Kato coefficients retain the logarithmic shift. Invariant
   degree is n+1, not n; lifted character/symbol cup degree is the
   total degree, not one (E2/E3). The ordinary cd bound is separate.
4. The strong Artin–Schreier condition has `M=E(α)` with coefficient
   in E (E6). Absolute injectivity has target `Gal(F^ab/F)`, while
   each finite target uses the norm quotient (E4). Kurihara's domain
   is differential degree q−1 (E5).
5. The general iterated restriction formula includes the otherwise
   missing last-residue restriction:
   `δ_L res_(L/F)=(∏e_i)res_(L_0/F_0)δ_F`.
   At m=n the last map is the identity on ℤ. The accepted norm node
   describes the ramification factor in shorthand; the package supplies
   the typed general formula, without changing that node.
6. The completed-flag finite-end specialization explicitly requires
   `κ(p_0)` finite. Excellence and the full flag give finite extensions
   of this field as terminal residues. Essential finite type over ℤ
   alone is insufficient: `Spec ℚ` satisfies it but its length-zero
   factor is ℚ, not a zero-local field. This qualifies the broad wording
   in the accepted HL.5/parshin-chains hypotheses and Morrow Corollary
   7.6. The README retains the general branch-field theorem and the
   finite-residue specialization, so no general branch construction is
   discarded. Reconcile the accepted packet wording in its next permitted
   correction; this job cannot edit it.
7. The finite-coefficient and duality prerequisite paragraphs use the
   actual PC/SF.2/CFT contracts. Degree-controlled alterations do not
   supply finite-module local duality. Quasi-finite terminal fields use
   `G≃ℤ̂`, not merely an unspecified procyclic group (the trivial group
   is procyclic but does not qualify).
8. Vostokov's S is a nonzero formal lifted multiseries; its evaluation
   is zero in F, so division occurs before evaluation. His comparison
   supplies only the sign ambiguity; the package retains a separate
   arithmetic normalization theorem and no p=2 formula. Zhukov's
   rational interpolation and strict endpoints remain explicit.
9. The nonreal constant-place bound is asserted for the local-constant
   compositum, not for an arbitrary formally real global field. The
   terse inequality in DP Proposition 3.2's proof cannot be read as a
   finite bound on the latter. The three Hasse statements keep their
   distinct prime, place, model, dimension and resolution hypotheses.

The accepted source-issue records E1–E10 remain unchanged. This handoff
records mathematical corrections, not a new errata job or an assertion
that any author has accepted a correction.

## Source verification and its limits

All exposition is newly written, with no source passages or source-by-section
summaries. All seven public source PDFs matched the accepted versions:

| Source | Version | SHA-256 |
| --- | --- | --- |
| Invitation | MSP published complete volume | `a6c9088000d9b18ded4d2159531d7544683b86d6eecdbb2ab6cc9b743baabe62` |
| Morrow | arXiv:1204.0586v2 | `c996cd77420a87bc1b657d7216f71f659f343cffe26046d171fade0eecf8b141` |
| Kerz | arXiv:0907.5337v3 | `616fd1b1ce373cd9c5990228e4cce4248aac2c3f7fceb1ea6f6b2050db5d48d5` |
| Kerz–Saito | PMIHES 115 (2012), published PDF | `f4bb5f8b378c148f4b458b964f78761156255396e1bade5d7a11717fef2689e7` |
| Jannsen | Annals 183 (2016), published PDF | `26dde9260f6475e4f6acbfbe651e18fac0d443a5f318fbf3974efc9f809f7d71` |
| Milne | Arithmetic Duality Theorems, second edition | `2c6195ec76a974f3f336c77cb71cc3845b018aad2d43136716b3477a3bc5fb31` |
| Dittmann–Pop | arXiv:2012.01307v2 | `f9f26f7d8d6b5cb6bf86d04bf97f8f99069d8d676623cebe706e90ea8dcb2c1f` |

Read the cited definitions and theorem statements and checked their local
hypotheses in the relevant sections: Invitation I §§1–2, 5–10 and 17,
Kato existence §§1–2 and the pp. 191–194 lifting argument; Morrow's
field/topology/Milnor sections, branch construction §§6–7 and adelic
§8; all of Kerz's sixteen-page paper; KS's niveau construction and
§8; Jannsen's global injectivity, alteration descent, Kato complexes
and characteristic-p resolution statements; Milne I.2 pp. 37–40; and
DP §2 and Proposition 3.2. The README uses the precise numbered
locators, including the actual Theorem 2 page 87 for Vostokov's
annihilator result and Theorem 2.17 page 38 for higher local duality.

These checks do not claim complete extraction of Kato's pp. 174–190,
the original Cohen/Epp, BGK, topological norm, Beilinson/Huber or
Kato–Saito proofs, or Jannsen's complete weight argument. The proof
inputs below remain required. The maintainer's library index was read;
no restricted book was needed, and no private source or extracted text
is submitted. No suspicious fetched instruction was encountered.

## Mathematical obligations retained from the accepted plan

| Gap | Required input and package location |
| --- | --- |
| G01 | Cohen/Epp standardization and topology invariance with imperfect residues; §§0.5–0.6, 0.10–0.11. |
| G02 | Categorical/raw/λ comparison in its exact characteristic scope; §§0.13–0.15, 3.5–3.6. Morrow 4.17 is a stated but unproved survey input. |
| G03 | All-prime Kato wild top-degree invariant and finite-order character proof, p-rank, conductors, Cartier and prime-power lifting; §§2.3–2.7, 3.1–3.5. Reading the ending does not close the omitted middle argument. |
| G04 | Generic imperfect-field BGK, trace/residue compatibility and imperfect-residue mixed-DVR comparison; §§2.5–2.6. CR.4 carriers, MEK M.5d and KLF L.5's current scope do not imply it. |
| G05 | Topological norm descent/Hilbert 90, norm closedness, divisible kernel including p=2; §§1.2–1.6. |
| G06 | Strong-tree reduction, principal-unit exactness and choice-independent inverse norm class; §3.4. |
| G07 | Full lifted Vostokov construction and arithmetic sign comparison; §4.2. |
| G08 | Rational interpolation of Zhukov labels and strict endpoint compatibility; §4.3. |
| G09 | Completed exponential in imperfect residue scope and its residue square; §4.4. No general kernel claim. |
| G10 | Excellent branch local algebra, henselian/completed compatibility and relative Milnor Gersten/purity with modulus; §§5.1, 5.4–5.7. |
| G11 | Beilinson/Huber exact functor and flasque resolution, including stalk exactness; §§5.2–5.3. |
| G12 | Local codimension-two reciprocity, finite support and wild residue/niveau identification; §§5.4, 6.1, 6.5. |
| G13 | Weights, degree-prime-to-ℓ alterations, Bockstein passage, nonreal local bounds, low-dimensional Kato/Suwa and high-dimensional two-clause resolution; §§2.4, 6.6–6.9. |
| G14 | Kato–Saito norm/existence/finite-modulus proofs, Wiesend connected kernel, and SF.2's actual scheme fundamental-group carrier; §§6.2–6.4. |
| G15 | Fixed Galois/coefficient carriers and chain-level sign, trace and localization comparisons; Layer 7. |

The two local proof routes use independently constructed finite-length
pairings; neither may assume reciprocity in order to prove itself.
Cross-layer references to those pairings specify their proof inputs,
not an assumption that later reciprocity comparisons already hold.
Packaging discharges no listed source or ownership gap.

## Lean and validation

`Suggested.lean` has 209 lines, one `import Mathlib`, one module note,
the namespace `TauCetiRoadmap.HigherLocalFieldsAndHigherClassFieldTheory`,
and layer comments in README order. It contains three light real-bodied
definitions on pinned carriers: coefficient boxes, admissible families,
and the topology generated by their translates. Five proved `example`s
check these definitions (at most two per definition). Eleven named
milestone/boundary theorems are admitted with `sorry`. No data definition,
instance or example is admitted; no private carrier, weakened headline
or auxiliary theory development is introduced. Heavy definitions remain
README targets and are named in the closing comment.

The eleven signatures were checked individually against §0.9: addition,
exact neighborhood containment, coefficient continuity, induced monomial
coefficient topology, Hausdorffness, the topology order inequality,
equality iff discrete, strict inequality, the discrete boundary, the
nonzero constant sequence and the outer degree-one ball. Coefficient
topology hypotheses match the README; all higher topology arguments
are explicit, while the native Laurent instance remains outer-adic.

- `lean-check research/blueprint/packages/HigherLocalFieldsAndHigherClassFieldTheory/Suggested.lean`:
  exit 0, no errors, exactly eleven `declaration uses sorry` warnings.
  The earlier reducibility warning was fixed with `@[instance_reducible]`.
  Available memory was 83 GB before the final invocation. Invocations
  were sequential, and both finished; no Lean process remains.
- The shared build's manifest and Mathlib checkout report exactly
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. The wrapper identifies its
  Tau Ceti source as the pinned build; the source directory has no Git
  metadata. The submitted file imports no Tau Ceti module and therefore
  does not depend on an unverifiable newer Tau Ceti declaration.
- Final Lean SHA-256:
  `2a16206b2926bab7b5977eac49965d0f44d8608505ea2cc1ef1d8d7b73de3a8c`.
- `python3 scripts/check_blueprint.py research/blueprint/packets/HigherLocalFieldsAndHigherClassFieldTheory.json`:
  0 errors, 0 warnings; 85 nodes, 139 API items, 101 tests, 15 gaps,
  27 requests, eight planned layers, zero closed layers.
- Completeness checks found all 139 API names, all eight Examples/Dependencies
  pairs, resolved local Markdown targets and no process language in the README.
  The node/test mapping and mathematical adversarial pass appear below.
- `python3 research/blueprint/intake.py check-files` on the four deliverables:
  4 files, 0 problems. The final staged diff also passes `git diff --check`.

Elaboration verifies types and the five proved examples, not truth of the
admitted milestones. The following pass supplies mathematical negative
controls beyond compilation. No Lake build/update/cache operation,
language server, second checkout or private project was used.

## Every-target mapping and adversarial mathematics pass

Each row names the accepted node slug, the README subsection and an instance
checked against the actual statement, hypotheses and convention. The tests
also cover any subsidiary API in the row's subsection. The 101 accepted
checks remain prose beside their definitions; this table is audit evidence,
not a replacement for those checks.

| Node | README | Instance and result |
| --- | --- | --- |
| `HL.0/n-dimensional-local-field` | §0.1 | The two residues of `ℚ_p{{t}}` are `F_p((t))`, then `F_p`; the first is not `ℚ_p`. |
| `HL.0/local-parameters` | §0.2 | `(u,t)` works in `F_q((u))((t))`; the reversed pair fails the outer-uniformizer condition. |
| `HL.0/rank-valuation-ring` | §0.3 | Reverse lexicographic order makes `(−100,1)` positive; the displayed threshold ideals form a strict ascending chain. |
| `HL.0/standard-mixed-series` | §0.4 | Nonnegative coefficients all equal to 1 are allowed, but infinitely many negative coefficients equal to 1 violate negative-tail decay. |
| `HL.0/classification-and-standard-fields` | §0.5 | The three two-local characteristic patterns give equal series, `E((t))`, and finite extensions of `E{{t}}`; standardness of the last field itself is not assumed. |
| `HL.0/higher-topology` | §0.6 | Constants `u^j` converge higher-additively, with outer valuation zero; opposing monomials disprove joint multiplication continuity. |
| `HL.0/extensions-and-ramification-matrix` | §0.10 | A purely unramified extension has all e_i=1 and total degree the terminal residue degree; inseparable intermediate residue degrees remain allowed. |
| `HL.0/teichmueller-representatives-and-expansions` | §0.11 | In `ℚ_3`, representatives `0,1,−1` are not additively closed; the inner support bound may depend on the outer exponent. |
| `HL.0/two-dimensional-examples` | §0.12 | Rescaling the Artin–Schreier generator gives residue `u^(1/p)`, e=1 and residue degree p despite separability upstairs. |
| `HL.0/topology-on-the-multiplicative-group` | §0.13 | In `ℚ_p((t))`, `1+t` vanishes in the prescribed `K_1^top` convention; the graph topology would separate it from 1. |
| `HL.0/perfect-and-quasi-finite-variants` | §0.14 | An infinite algebraically closed perfect end field has trivial Galois group and fails the required `G≃ℤ̂` condition. |
| `HL.0/pro-ind-finite-objects` | §0.15 | At depth zero the finite-set construction is the finite field itself; higher truncated rings require pro/ind objects, not finite point sets. |
| `HL.1/iterated-residue-with-signs` | §1.1 | Last-uniformizer convention gives `δ{u,t}=1`; reversing the two entries gives −1. |
| `HL.1/norms-and-projection-formulas` | §1.2 | In top degree a terminal unramified extension multiplies the integer residue by its degree; in higher degree restriction also needs the terminal residue restriction. |
| `HL.1/topological-milnor-k-groups` | §1.3 | The valuation class survives the quotient, while Steinberg symbols vanish; `K_0=ℤ` is separately discrete. |
| `HL.1/parshin-structure-of-the-topological-k-group` | §1.4 | For n=2 the top-degree group has one integer component and two tame factors `ℤ/(q−1)`; the principal part has no p-torsion. |
| `HL.1/filtration-on-milnor-k-groups` | §1.4 | Raising the principal-unit depth gives a smaller subgroup; a valuation generator is outside positive depth. |
| `HL.1/acceptance-computation-of-an-iterated-residue` | §1.5 | The two-step residue of the parameter symbol is 1, and the constant-extension norm multiplies it by the terminal degree. |
| `HL.1/topological-versus-algebraic-k-groups` | §1.6 | The integer valuation component is nonzero modulo every a>1, so a divisible-kernel statement cannot erase it. |
| `HL.2/finite-kato-coefficient-complex` | §2.1 | In characteristic p the p-primary complex is logarithmic with its shift; substituting étale `μ_p` would lose the desired group. |
| `HL.2/kato-cohomology-groups` | §2.2 | q=1 is the character group, and q=2 the Brauer group; changing the coefficient length respects the colimit. |
| `HL.2/restriction-corestriction` | §2.2 | `cor res` is multiplication by the extension degree; odd degree implies injectivity on 2-torsion, while quadratic degree does not. |
| `HL.2/low-degree-identifications` | §2.2 | Dimension one places the local invariant on q=2 Brauer classes, not q=1 characters. |
| `HL.2/kato-residue-theorem-and-the-invariant-map` | §2.3 | For a two-local field the invariant is on `H^3(F,2)`, and the outer residue lands in the one-local Brauer group. |
| `HL.2/cohomological-dimension-and-tate-twists` | §2.4 | For `ℚ_p((t))`, ℓ=p belongs to the ordinary characteristic-zero coefficient range, although it is wild at the lower mixed step. |
| `HL.2/norm-residue-and-the-symbol-identification` | §2.6 | Degree-one dlog kills exactly p^s-th powers in the characteristic-p comparison; ordinary zero `μ_p` is not that coefficient object. |
| `HL.2/logarithmic-de-rham-witt-coefficients` | §2.5 | `F_p((u))` is imperfect, so the outer residue of `F_p((u))((t))` requires the generic imperfect-field contract. |
| `HL.2/finite-coefficient-duality` | §2.7 | The infinitely many Artin–Schreier classes in `H^1(F_p((u))((t)),ℤ/p)` refute a blanket finite-group duality claim. |
| `HL.2/two-dimensional-residue-pairing-acceptance` | §2.8 | A constant character cupped with `{u,t}` evaluates by the terminal trace; interchanging u and t changes the sign. |
| `HL.3/reciprocity-map` | §3.1 | The ordered parameter symbol acts by arithmetic Frobenius on the constant unramified extension; inversion fails this normalization. |
| `HL.3/isomorphism-theorem` | §3.2 | A constant extension of terminal degree d has norm quotient `ℤ/d`; the absolute group is not a finite norm quotient. |
| `HL.3/parshin-reciprocity-in-characteristic-p` | §3.3 | At dimension one the Witt-character construction has the imported function-field normalization; constant symbols give its Frobenius test. |
| `HL.3/artin-schreier-trees-and-the-explicit-construction` | §3.4 | The strong condition adjoins the generator to E with coefficient in E; cyclic fixed fields use the closure of the subgroup generated by σ. |
| `HL.3/existence-theorem` | §3.5 | At dimension one the categorical finite-index condition recovers ordinary open norm groups; the characteristic-zero pullback topology cannot replace it unchecked. |
| `HL.3/kernel-and-completion-statements` | §3.6 | The finite targets are quotients by norms, while absolute injectivity has target `Gal(F^ab/F)`; completion changes the dense image to the profinite target. |
| `HL.3/unramified-acceptance-case` | §3.7 | Iterated residue followed by reduction modulo d controls Frobenius in a constant degree-d extension. |
| `HL.4/higher-tame-symbol` | §4.1 | `{u,v}` for outer units has trivial tame symbol, `{u,π}` gives ū, and `{π,π}` gives −1. |
| `HL.4/explicit-formulas-for-the-hilbert-symbol` | §4.1 | A power in any symbol entry pairs trivially; the parameter symbol and an unramified character fix the arithmetic normalization. |
| `HL.4/vostokov-pairing-and-the-wild-existence-case` | §4.2 | The trace-one Shafarevich generator yields the chosen ζ; division uses the nonzero lifted series S before its zero evaluation in F. |
| `HL.4/ramification-filtrations-and-their-indexing` | §4.3 | The equations with `t^(−i)u` and `t^(−i)u^p` have the distinct stated fractional breaks; equality at an endpoint is excluded by the strict inequality. |
| `HL.4/kurihara-exponential-and-differential-forms` | §4.4 | q=1 takes scalar differentials; q=2 sends `a dlog T` to `{exp(ηa),T}` and its completed T-residue to the scalar exponential. |
| `HL.4/artin-schreier-witt-acceptance-computation` | §4.5 | At length one, `w=t^(−1)` paired with `{u,1+t}` gives residue 1 over `F_p`; a Frobenius coboundary pairs to zero. |
| `HL.5/parshin-chains` | §5.1 | A finite terminal point gives higher-local branch factors; `Spec ℚ` shows why essential finite type over ℤ alone does not imply a finite end field. |
| `HL.5/higher-adeles` | §5.2 | On a curve the recursion gives the restricted product, whereas arbitrary products lose the integrality condition; the seven surface components have different carriers. |
| `HL.5/adelic-resolution` | §5.3 | The curve complex has generic and integral local terms in degree zero and restricted products in degree one; a product without restriction fails. |
| `HL.5/residue-maps-along-a-flag` | §5.4 | Swapping the two surface parameters reverses the iterated symbol residue; singular points require the sum over normalization branches. |
| `HL.5/higher-idelic-and-cycle-complex-input` | §5.5 | A Q-chain omits the specified penultimate point; its relation uses all inserted branches, and modulus is imposed through the principal-unit subgroups. |
| `HL.5/nisnevich-class-group-comparison` | §5.7 | At zero modulus the closed-point cycle class agrees with the degree-d Milnor cohomology class; positive modulus changes the relative sheaf. |
| `HL.5/functoriality-and-direct-images` | §5.6 | On a curve the finite pushforward is the idele norm, and a constant extension gives the terminal degree multiplier. |
| `HL.5/acceptance-recover-ideles-and-list-surface-flags` | §5.8 | The surface has seven nonempty index subsets; the `012` term uses flags and iterated restrictions, rather than all pairs of points. |
| `HL.6/reciprocity-relations` | §6.1 | At a singular specialization every normalized branch is needed for cancellation; deleting one need not leave zero. |
| `HL.6/global-reciprocity-for-arithmetic-schemes` | §6.2 | Local closed-point Frobenius classes satisfy Q-chain relations; finite-modulus quotients, not an unqualified raw group, carry the asserted finite comparison. |
| `HL.6/wiesend-class-group` | §6.3 | The identity component lies in the kernel; the quotient by that connected component is distinct from simply declaring the raw class group profinite. |
| `HL.6/tame-and-wild-proper-and-open-variants` | §6.4 | At residue characteristic p, removing the pro-p part changes wild inertia to the tame quotient; a proper scheme instead has its unramified target. |
| `HL.6/reduction-of-the-curve-case` | §6.4 | For `Spec O_K` the local-unit inertia quotient is required before comparing finite ideles with the scheme fundamental group. |
| `HL.6/kato-complexes-and-boundary-square-zero` | §6.5 | The arithmetic-curve row is Brauer to characters in degrees 1→0; square-zero follows from the niveau differential, not a list of point residues. |
| `HL.6/constant-place-fields` | §6.6 | For `K=k(t)`, the constant extension is `k_v(t)`, not `k_v((t))`; real and complex constant places have different cohomology. |
| `HL.6/resolution-f2` | §6.7 | A generically finite alteration is not a birational resolution, and a singular boundary fails the second independent clause. |
| `HL.2/nonreal-local-cd-bound` | §2.4 | The finite bound is applied to the nonreal local-constant compositum, not to the potentially formally real global field. |
| `HL.6/lgp-global-base` | §6.8 | The number-field 2-primary theorem must include real places; the finite-coefficient reduction uses the preceding-degree divisibility argument. |
| `HL.6/lgp-good-model` | §6.8 | A characteristic-zero function field over a DVR of residue characteristic two fails this branch's residue-characteristic hypothesis. |
| `HL.6/lgp-characteristic-two` | §6.8 | At Kronecker dimension four both resolution clauses are explicit assumptions; ordinary `μ_2` would erase the logarithmic coefficient group. |
| `HL.6/kato-hasse-global-models` | §6.9 | The arithmetic cone has degree-a term `D_a ⊕ C^0_a` with the displayed shift; the finite-field theorem uses `C^0`, not the global cone. |
| `HL.7/dimension-one-artin-map-comparison` | §7.1 | On the identified one-local carrier a uniformizer maps to arithmetic Frobenius for both maps. |
| `HL.7/brauer-invariant-comparison` | §7.2 | The n=1 higher invariant is the ordinary Brauer invariant; higher evaluation of a constant character on the parameter symbol reduces to the terminal trace. |
| `HL.7/finite-duality-comparison` | §7.3 | `ℚ_p((t))` retains characteristic-zero bottom-local coefficients, including ℓ=p, with the same ordered cup and trace comparison. |
| `HL.7/motivic-residue-comparison` | §7.4 | The outer boundary of `{u,t}` is `{u}` and its next boundary is 1 on both identified localization carriers. |
| `HL.0/coefficient-box` | §0.7 | The full subgroup family gives all Laurent series; a forbidden coefficient at a negative exponent excludes its monomial. |
| `HL.0/coefficient-box-membership` | §0.7 | Membership checks every integer coefficient, including arbitrarily negative ones. |
| `HL.0/coefficient-box-single` | §0.7 | For any integer j, the monomial belongs exactly when its coefficient belongs to U_j. |
| `HL.0/coefficient-box-intersection` | §0.7 | Pointwise intersection gives subgroup intersection; a monomial outside either corresponding subgroup is excluded. |
| `HL.0/coefficient-box-tail` | §0.7 | If U is full from N onward, every series supported in degrees ≥N belongs, including the degree-N boundary monomial. |
| `HL.0/coefficient-filter-basis` | §0.8 | Intersecting admissible boxes uses the maximum of their thresholds; a fixed proper subgroup at all positive exponents is not admissible. |
| `HL.0/coefficient-filter-basis-membership` | §0.8 | Membership means equality with an admissible box, while an arbitrary superset is only a neighborhood. |
| `HL.0/equal-characteristic-higher-topology` | §0.9 | Generating by translated boxes is a real topology construction on the native Laurent carrier; no native instance is replaced. |
| `HL.0/higher-topology-basis-specification` | §0.9 | The generated topology must equal the additive filter-basis topology; mere openness of the selected boxes is insufficient. |
| `HL.0/higher-topological-add-group` | §0.9 | Box subgroup laws supply addition and negation continuity without claiming joint field multiplication. |
| `HL.0/higher-neighborhood-basis` | §0.9 | A superset of a box is a neighborhood even when it is not itself an admissible box. |
| `HL.0/open-subgroup-boxes-cofinal` | §0.9 | The nonarchimedean subgroup basis refines every coefficient neighborhood separately; its hypothesis cannot be omitted for arbitrary topological fields. |
| `HL.0/higher-coefficient-continuity` | §0.9 | Restricting one integer coefficient to an open subgroup makes its projection continuous, including negative exponents. |
| `HL.0/higher-single-induced-topology` | §0.9 | The monomial map induces precisely K's topology; with nondiscrete K it cannot inherit the discrete constant topology of the outer valuation. |
| `HL.0/higher-hausdorff` | §0.9 | A nonzero series has a nonzero coefficient; coefficient separation uses the explicit `T2Space K` hypothesis. |
| `HL.0/higher-versus-outer-topology` | §0.9 | Every admissible box contains an outer tail; Mathlib's reverse topology order therefore reads `outer ≤ higher`. |
| `HL.0/higher-equals-outer-iff-discrete` | §0.9 | Discrete coefficients permit the ordinary outer balls; conversely equality would make the induced constant topology discrete. |
| `HL.0/higher-strictly-coarser` | §0.9 | With nondiscrete coefficients the degree-one outer ball is not higher-open, witnessed by its intersection `{0}` with constants. |

## What remains and where to resume

The package is ready for its independent package review; no assembly task is
left unfinished. Review the four delivered files against the accepted inputs,
with particular attention to the two additional typed corrections (terminal
residue restriction and finite terminal branch fields), the multiplicative
topology convention and the separate source obligations G01–G15. Those
obligations describe the mathematics the roadmap still asks Tau Ceti to
formalise, not completed proofs. The accepted packet's overly broad branch
finite-end wording should be reconciled only in a job permitted to change it.

All durable source versions, locators, corrections and validation results
are recorded above or in the README. No next worker needs the disposable
downloaded PDFs, extracted text or scratch notes. No instruction from fetched
data was followed, and no suspicious instruction was encountered. This run
submits this one claimed package and takes no second job.
