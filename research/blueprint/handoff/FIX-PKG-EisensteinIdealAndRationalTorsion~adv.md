# FIX-PKG-EisensteinIdealAndRationalTorsion~adv — checkpoint

Issue: #11137. Agent: Codex, session `codex-anngrn`. Input atlas commit:
`4ba80569a0a957681c98ecf3e6e09aa34a43ad0b`.

## Disposition and blocking condition

This is a **checkpoint**, not a completed supplier-closure repair. The package
remains `needs_changes`. All four findings C1–C4 from
`research/blueprint/reviews/REV-PKG-EisensteinIdealAndRationalTorsion~codex.md`
still require actual targets in their owning suppliers and a consistent order
update. No matching `~adv` review file exists; the issue explicitly names the
`~codex` report as its findings.

The issue's deliverables and its final RULES permit only the Eisenstein package
and this handoff. WORKERS.md also says to edit only named deliverables and
scratch space. The required supplier packages, their packets, any continuation
registration, and the tier-order file are outside that scope. I requested scope
clarification while continuing the authorized source checks and package
repairs; no expansion was supplied before submission. A prose requirement in
this consumer is not an owning target, so it would be incorrect to mark the
findings resolved. Resume by authorizing the supplier/order changes or routing
them to their owners, then recheck closure before accepting the package.

## Finding → authorized change → residue

| Finding | Changes in this checkpoint | Still required |
| --- | --- | --- |
| C1: integral modular differentials | Replaced the broad comparison promise by precise coarse/resolution/stack and A/B distinctions, coefficient-ring hypotheses, base-change and Serre-duality requirements, Hecke transpose compatibility, and four discriminating Checks. Corrected locators: II §3 pp. 67–69 and §4 pp. 69–77 precede §§5–6 pp. 78–90. Named existing general-duality inputs instead of replanning them. | Actual integral modular comparison targets in the modular-curve owner, including the level fibre and elliptic-point corrections; incoming references here and in the relevant packets. |
| C2: global admissible groups | Removed unnecessary congruence hypotheses from the cohomology inequality; pinned the global base of the rank-one theorem; distinguished finite-flat from quasi-finite models and geometric fibre lengths. Specified D and generic multiplicative-type amalgams. Moved the Hecke-dependent saturation proof into §4.5, with its hypotheses and negative control. Removed the assertion that the existing finite-flat Part II supplies this theory. | Actual global-model/cohomology/purity/D/amalgam targets in an authorized continuation of finite-flat theory, with prerequisites, API and Checks. Generic local full faithfulness and a Hom/Ext sequence are insufficient. |
| C3: connected Néron cohomology and cotangents | Separated the connected Kummer/localization requirements from the cotangent theorem. Stated the general exact abelian-sequence cotangent result with semistability and e<p−1, and its p∥N modular specialization. Retained the weaker dyadic Sha inclusion and component/skyscraper defects. Added zero, additive-fibre, split-sequence and boundary counterchecks. | Actual connected-Néron cohomology and semistable quotient-cotangent targets in the Néron owner; source-supported general local-condition statements and actual incoming references. |
| C4: inverse class-group eigenspace | Specified the general odd-character Stickelberger/Herbrand implication and its inverse-character specialization. Distinguished the Teichmüller character on the P-primary group from its residual character on cyclic P-quotients. Fixed the conjugation direction with a mod-5 witness and recorded the P=3 boundary. | A registered ClassFieldTheory continuation with ideal-class eigenspaces, annihilators and equivariant unramified-extension quotient targets; placement before any global Ext proof using them. |

All 56 numbered targets are retained, in order. No all-prime, dyadic,
Deligne–Rapoport, Néron-model, coefficient-equals-level or general-level target
was dropped. The earlier review's bad-reduction formal-kernel repair in §7.9
and Mazur–Tate §4 Lemma p. 47 locator in §8.3 are retained. Suggested.lean is
unchanged: the supplier objects lack the pinned carriers needed for faithful
compact signatures. No substitute structure or theorem assuming its intended
conclusion was introduced.

## Concrete owner work to resume

The labels below are proposed target identifiers for the owner to register,
not existing nodes or evidence that closure holds. The expanded contracts and
Checks in the package give their mathematical statements.

### C1 — integral modular differential comparison

Owner: `ModularCurvesPartII`, with an authorized extension of its integral
geometry and weight-two comparison. Update its package and applicable
`ModularCurvesPartII--…` packets, not the current upstream checkout.

Proposed targets: `integral-dualizing-forms`,
`integral-modular-serre-duality`, `integral-hecke-duality-compatibility`.
Prerequisites: its compactified coarse/resolved modular models, integral cusp
charts and geometric Hecke correspondences; `SchemeAndStackFoundations`
SF.2 targets T286 and T298–T301; StableReduction's curve duality. Do not
redefine the general dualizing sheaf. The existing §7.2 characteristic-zero
comparison and §§7.5–7.6 rational pairings do not provide this lattice.

API should identify B⁰(R) with global dualizing differentials, distinguish
B(R) and A(R), preserve q-expansions/residues under the stated base changes,
and identify Hecke adjoints under integral Serre duality. Required tests
include the zero genus, node-residue and characteristic-2/3 corrections now
recorded in the contract. Apply these outputs to §§0.3–0.4, 3.2, 4.1 and
4.6, and the differential input in §7.9.

Primary source: Mazur 1977 II Definition 3.1, (3.2), Lemma/Proposition 3.3,
Proposition 3.4, pp. 67–69; Lemmas 4.5–4.8 and convention 4.9, pp. 75–77;
§§5–6 pp. 78–90; §9 pp. 94–96. There is no blanket identification of
arbitrary moduli-theoretic forms and the coarse differential lattice at P.

### C2 — global finite-flat and quasi-finite arithmetic

Owner: the `FiniteFlatGroupsAndIntegralPadicHodgeTheory` direction. Its
existing Part II packet/reader is **tensor/display deformation theory**, with
standing p>2. It must not be cited as if it already contains global admissible
groups or repurposed silently. A maintainer ownership/continuation decision
is needed. There is no package for that Part II in this input.

Proposed targets: `admissible-global-models`, `admissible-geometric-lengths`,
`admissible-cohomology-bound`, `admissible-rank-one-global`,
`admissible-global-purity`, `dyadic-D-model`, `dyadic-finite-flat-amalgam`.
Prerequisites: the base roadmap's closures/quotients, local models and gluing,
fppf cohomology and localization, global class-field reciprocity, and C4 when
using the class-field proof of the Ext vanishing. R07.1.39 provides the
Mayer–Vietoris Hom/Ext sequence; it does not state the resulting global
Ext¹(μ_ℓ,ℤ/ℓ)=0 as a supplied theorem. Nor does it provide the h¹−h⁰ bound.

The contract now names the API, marked bases and generic comparisons. Carry
over its geometric-fibre, constant/μ₂ cohomology and extension-by-zero tests.
Do not classify all rank-one groups over ℤ[1/P] by Proposition 1.5: that
proposition is finite flat over ℤ. Do not apply odd purity to D at 2.

Only the general D/amalgam construction belongs here. Mazur II Lemma 17.5
also needs T-stable subgroups inside J₂[η_l], the Frobenius relation, the
rank-one étale bound and separation from 1+w. Its iteration in Lemma 17.7
belongs to this consumer's §4.5. Moving that entire proof into the supplier
would introduce a circular dependency. A multiplicative-type amalgam factor
need not be μ-type.

Primary source: Mazur 1977 I §§1–5 pp. 43–61, especially Proposition 1.5
pp. 46–47, Proposition 1.7 p. 49, Proposition 2.1 pp. 49–54, Proposition 4.5
pp. 59–60 and Propositions 4.2–4.4 pp. 58–59. II §17's definition and Lemma
17.3 pp. 130–131 support the amalgam comparison; Lemmas 17.5 and 17.7
pp. 131–134 carry the additional arithmetic hypotheses.

### C3 — connected Néron cohomology and exact cotangents

Owner: the `NeronModelsAndSemistableAbelianVarieties` direction. Its current
Part II concerns genus-one fibrations, and does not fill these interfaces.

Proposed targets: `connected-neron-kummer`, `connected-neron-localization`,
`neron-isogeny-component-defects`, `semistable-quotient-cotangent`.
Prerequisites: marked connected Néron models, component sheaves, semistable
reduction and torsion kernels, fppf long exact sequences, localization and
the existing height/Selmer definitions. Establish Kummer surjectivity on
semiabelian fibres; it fails on an additive fibre in equal characteristic.
Specify which generic torsors lie in the restriction image and account for
the real-place 2-primary issue. For the modular application retain odd Sha
equality and the dyadic inclusion. The specific Eisenstein isogeny
kernel/component computation stays in Layer 6 here.

The cotangent theorem is for every exact abelian sequence with semistable
middle term over a p-adic field satisfying e<p−1. Its quotient is free, so
residue-field injectivity follows; the same-dimensional lattice injection
in existing §6.4 allows torsion cokernel and is insufficient. The modular
application includes p∥N, with arbitrary level N localized at the primes
dividing the square part. It must not acquire a good-reduction hypothesis.

Primary source: Mazur 1977 III Lemmas 3.2–3.3 and Proposition 3.6
pp. 148–151; Mazur 1978 §1(d), Propositions 1.2–1.3 and Corollary 1.1
pp. 135–137, §1(e) p. 138, and §2(d–e) pp. 140–141. For a broader
number-field Sha comparison than the modular specialization explicitly
used here, verify its local conditions in the original cohomological source
before asserting it; Mazur 1977 cites his 1972 appendix. That appendix was
not retrieved or checked in this run.

### C4 — cyclotomic ideal-class eigenspaces

Owner: an authorized ClassFieldTheory continuation following current Layer
13. No `ClassFieldTheoryPartII` packet, package or numbered upstream target
was found. A maintainer registration decision is needed; the current
upstream roadmap is read-only and is not to be edited in this clone.

Proposed targets: `cyclotomic-class-eigenspaces`,
`stickelberger-herbrand-annihilator`,
`inverse-character-unramified-quotient`.
Prerequisites: the ideal class group, its cyclotomic Galois action,
Teichmüller eigenspace projectors, Bernoulli numbers and existing global
reciprocity with equivariance. API should give the inverse eigenspace
vanishing on the whole P-primary group, and rule out its cyclic P-quotient
with χ_P⁻¹ action. Require L/ℚ Galois when forming the action on Gal(L/K).
Preserve the action on ideals versus conjugation gxg⁻¹;
it is distinct from a Hom dual action. The mod-5 witness in the contract
detects reversing that character. No regular-prime assumption is allowed.

Primary source: Mazur 1977 I Proposition 2.8 and Corollaries 2.9–2.10
pp. 53–54. The j=1 clause treats the P=3 boundary; for P≥5, j=P−2 uses
B₂=1/6. Current ClassFieldTheory's idelic Herbrand quotient is unrelated to
this annihilator theorem.

## Ordering and closure recheck

The checked order file is `research/blueprint/upstream/CaraianiNewton.md`.
It has Néron at tier 8, heights at tier 9, finite-flat theory at tier 10,
and ModularCurvesPartII and automorphic forms at tier 11. Eisenstein is not
listed. Merely inserting it after heights does not order its dependencies.

Required partial order, in addition to those suppliers' existing inputs:

1. Current ClassFieldTheory → C4 → the C2 Ext proof that uses C4.
2. Existing geometric duality and modular curves → C1.
3. Existing finite-flat/Néron theory → C2 and C3, with C3's cotangent
   theorem independent of Eisenstein arithmetic.
4. C1, C2, C3, C4 and all existing package suppliers → Eisenstein.
5. Inside Eisenstein: §3.2 and §4.4 plus the general D/amalgam output →
   §4.5 saturation. No edge returns from C2 to the Eisenstein saturation.

After targets and continuation identities exist, replace every extension
reference in this README and the consumer packet with actual owning
target/section references; synchronize the blueprint reader/suggested file
if its contracts change; update the order and reconcile any supplier
requests. Walk all 56 targets recursively, checking bases and hypothesis
strength. A checker passing the existing packet is not a closure proof:
the unchanged packet still reports nine gaps and 23 requests, with no closed
stage. Do not accept this package until the C1–C4 edges actually terminate.

## Adversarial pass on touched mathematics

These are source and arithmetic checks of statements, not new Lean proofs.
Heavy-carrier Checks stay in the README under the current package-shape rule.

| Statement/interface | Instances and attempted failure | Result/change |
| --- | --- | --- |
| Relative dualizing comparison | Genus zero; nodal branches with residues a,−a; characteristic 2; field versus mixed-characteristic base | Zero lattices allowed; residue sum zero in every characteristic. Retained local freeness and distinct coarse/resolution base-change hypotheses. |
| A/B comparison | P=5 at 2; P=7 at 3; modulus prime to P versus modulus P | Noncuspidal codimension-one correction retained; cuspidal genus-zero spaces vanish. No A=B assertion at P. |
| Connected Kummer | A=0; m=1; m=0; semiabelian versus additive special fibre | First two sequences trivial; m=0 excluded. Multiplication by p on G_a in characteristic p is zero, so semistability is necessary. Component quotient not discarded. |
| Néron localization/Sha | Odd primary part; 2-primary part; nontrivial components | Equality required only in odd part for the stated modular application; dyadic inclusion retained, with no vanishing deduction. General number-field comparison not inferred from this specialization. |
| Cotangent exactness | Product sequence; zero A or C; multiplication-by-p lattice; p=2,e=1; p∥N | Split product ranks agree. Multiplication by p loses residue injectivity and cannot substitute for a free cokernel. Strict ramification condition excludes Serre's boundary counterexample; semistable bad reduction remains included. |
| Admissible models/lengths | Zero group; ℓ=P; full constant and extension-by-zero models | All five invariants zero for zero group; ℓ=P excluded. Same generic constant module can have δ=0 or 1. |
| Global cohomology bound | ℤ/ℓ: (δ,α,h⁰,h¹)=(0,1,1,0); μ₂: (0,0,1,1); level not congruent to 1 | Bounds are −1=−1 and 0=0. Keeping h⁰ is essential. Source Proposition 1.7 has no extra congruence hypothesis. |
| Rank-one classification | k=𝔽_ℓ or a finite extension; ℓ=2; base ℤ versus ℤ[1/P]/ramified DVR | Global finite-flat base and k-rank one retained. Constant and μ₂ have the same generic character and distinct integral étale lengths. |
| Odd purity and D | ℓ odd; D at ℓ=2 with odd level P | D is unramified at P yet nonsplit; parity restriction is essential. No inference from local full faithfulness at e=ℓ−1. |
| Generic dyadic amalgam | M=μ₂; rank(M)=4; zero M; general multiplicative type | Ranks 4 and 8 from rank(M)·4/2; zero M cannot contain μ₂. Removed the unsupported μ-type restriction. |
| §4.5 saturation | D⊂D×ℤ/2; order-two quotient; both killed by 2 | Larger group's special étale order is 4, so general finite-flat hypotheses alone do not imply saturation. Retained ambient Hecke/Frobenius, multiplicity and separation hypotheses; this argument stays here. |
| Inverse eigenspace | P=5,j=3; P=3,j=1; zero Y; irregular primes; higher P-power exponent | B₂ numerator 1 and denominator a unit at 5, not at 3. Uses separate j=1 theorem at 3. Teichmüller action required before reducing exponent to P; no full class-number assertion. |
| Equivariant quotient direction | χ₅(g)=2 acting on Hom(μ₅,ℤ/5); nonnormal L/ℚ | Inverse action is 3, since 2·3=1 modulo 5; direct action 2 is different. Require L/ℚ Galois to form the action on Gal(L/K); the abelian kernel makes it lift-independent. |
| Scope/order | P=2,3,5,7,13; dyadic levels 17,41; level-primary coefficients; arbitrary N | All 56 targets retained; no narrowed terminal theorem or new upward supplier citation. Global closure remains open for actual supplier targets and order. |

The node-residue signs, amalgam rank formula, inverse-character witness,
Bernoulli denominator boundary, strict e<p−1 boundary, and n(17)=4,
n(41)=10 were also checked with exact integer/rational arithmetic. This
does not compute group-scheme cohomology; its values above were checked
against Mazur's elementary-group table and Proposition 1.7.

## Sources, baseline and validation

Direct public primary-source reads for this fix:

- [Mazur 1977](https://www.numdam.org/item/PMIHES_1977__47__33_0.pdf),
  the locators listed above. Rendered p. 131 was inspected to confirm every
  hypothesis of Lemma 17.5; rendered p. 49 was inspected for Proposition 1.7.
- [Mazur 1978](https://www.math.columbia.edu/~goldfeld/Mazur-Goldfeld1978.pdf),
  §§1–2(e), especially pp. 135–138 and 140–141.

Read current upstream ClassFieldTheory and ModularCurves as models. Current
upstream checkout: `0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau
Ceti: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Rechecked the supplier
boundaries above and object searches in the nine newer upstream roadmaps.
The dualizing-module occurrences in LocalGaloisGroups concern Demuškin
orientation; the duals in AlgebraicVectorBundles concern vector bundles.
Neither provides C1. The ClassFieldTheory Herbrand occurrences concern
idelic/local-unit quotients, not C4. The reviewed library-coverage data has
no entry for this new roadmap. Existing generic duality is imported and was
not added as a new target in this package.

Read the pinned Mathlib statements for native nonsingular Weierstrass points,
the unit-discriminant ellipticity condition, the class-number carrier and
Minkowski bound. Suggested.lean uses those existing point/class-number
carriers and its one real-bodied index definition. The shared check's
Mathlib source is `082e2d37e8b0463410cdb532e111cd43d5a66174`; the runner
identifies its Tau Ceti build as `f790474`. No lake command was run in the
current upstream/library checkout. No restricted source file or passage is
included in this submission. No suspicious source instruction was followed.

Validation performed:

- `lean-check research/blueprint/packages/EisensteinIdealAndRationalTorsion/Suggested.lean`
  exited 0: nine expected `sorry` warnings, no errors or other warnings.
  Suggested.lean remains 102 lines, with one real-bodied definition, nine
  theorem signatures and two proved examples.
- `python3 scripts/check_blueprint.py research/blueprint/packets/EisensteinIdealAndRationalTorsion.json`
  exited 0: zero errors/warnings; 56 nodes, nine gaps, 23 requests. The
  packet was not edited and that result does not resolve C1–C4.
- Compared all numbered README headings before/after: the same 56 targets
  remain in the same order. Exact arithmetic checks above passed.
- `python3 research/blueprint/intake.py check-files` on the three changed
  deliverables reported three files and zero problems. `check_sorry_data.py`
  passed for Suggested.lean, and `git diff --check` passed.

Submission validation and final diff checks are recorded in the PR. All
resume information is in this handoff and the package; no disposable scratch
file is needed by the next worker. Stop after submitting this one job.
