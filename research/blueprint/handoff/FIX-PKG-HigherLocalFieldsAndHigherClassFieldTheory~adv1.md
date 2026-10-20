# FIX-PKG-HigherLocalFieldsAndHigherClassFieldTheory~adv1

Issue #11442; Codex, session `codex-iZ8Zcz`, 20 October 2026.
Branch `codex-iZ8Zcz-fix-higher-local-fields`; starting main `6ac139baa`.
Claim confirmed by the bot in issue comment 6294365109. This is the only job
taken in this run.

**Checkpoint; needs_changes.** The local repairs below are complete, but the
remaining supplier exports and dependency-order assignment cannot be supplied
inside this issue's four permitted files. No foreign packet or package was
edited, and no higher-field target was removed to hide a missing prerequisite.
The reviewer field records a fix, not a new independent review or acceptance.

The issue's `REV-PKG-HigherLocalFieldsAndHigherClassFieldTheory~adv.md` is
absent at starting main. The available input is the full
[independent review](../reviews/REV-PKG-HigherLocalFieldsAndHigherClassFieldTheory.md)
and its [handoff](REV-PKG-HigherLocalFieldsAndHigherClassFieldTheory.md).
Their R1–R3 are the findings addressed here. The independent review's other
corrections remain intact: rank principal versus outer-depth units, actual
MEK/K2 ownership, auxiliary unramified-field parameter independence, nonzero
two-flag cancellation, full primary-extension scope and all real-place terms.

## Finding dispositions

| Finding | Repair in the package | Residue |
| --- | --- | --- |
| R1: imperfect/wild coefficients and comparison maps | Exact supplier contracts now distinguish `logWittFieldTransfer`, `logWittDVRComparison`, `logWittRegularPurity` and `mixedKatoDualizingComparison`. Each states maps, hypotheses, source ranges and consumers. Sections 2.5–2.6 distinguish field maps transported through BGK/Witt from an independently constructed geometric boundary or trace. | The stronger geometric exports are still absent from the supplying packages. In particular, Shiho's all-length Gersten exactness does not prove an all-length geometric differential comparison on arbitrary excellent regular schemes. |
| R1: higher local duality route | Section 2.7 now defines the conductor filtration, its unit annihilation, the actual differential graded pairings, Cartier terminal quotients, cyclotomic descent and the q=0 endpoint. Section 2.3 uses Kato's field proof, rather than demanding mixed-scheme absolute purity to construct the field invariant. | The generic finite-p-rank pairing is not declared nondegenerate. Nondegeneracy after the final trace is a higher-local-field theorem with finite last residue field. This repair supplies the local proof route; it does not close every old packet proof obligation. |
| R1: Kurihara's exponential | Section 4.4 specifies the completed absolute differential module, exterior powers, completed Milnor group, nonunit generator formula and zero-entry handling. It retains the strict bound and all p, including 2. Mathlib differential/completion carriers are imported by name. | No perfect-residue KLF calculation is substituted for Kurihara's general theorem. The full mixed-series residue square stays a named target here. |
| R2: finite étale covers and abelian fundamental group | Import ConstructibleEtale Layer 3's actual finite-cover category and geometric fibre functor. Apply ProfiniteArithmetic's existing profinite abelianization. | Resolved mathematically to a specific other-author upstream PR; the overall HL ordering still needs assignment. |
| R2: branch purity and cohomological purity | Import PurityOfBranchLocus §§0.1/2.2 with normal source, regular target and generic separability; import LefschetzPencilsAndVanishingCycles §0.10 for regular pairs and invertible coefficients. | These two purity statements are distinct; neither is used as a wild logarithmic purity theorem. |
| R2: arithmetic homology and niveau | Section 6.5 constructs `KatoEtaleHomology` from actual EDC §0.2 dimension-one duality and six operations, with field/trait shifts, dimension function, support filtration, point colimits, field stalks and signed residue differential. `KatoComplex.niveauSign` specifies the chain isomorphism. | The invertible-coefficient construction now has named targets and exact suppliers. Its wild variants retain the separately scoped missing differential/duality exports. |
| R3: degree control and descent | Exact supplier contracts state `properPrimeToEllAlteration` in Jannsen Theorem 2.11's global form. `HigherHasse.alterationDescent` imports existing transfer and radicial invariance and assembles the local-global restriction square. | No supplying target of this exact global form was found. EDC Part II's regular covering family and its proper intermediate scheme do not assert that the same proper intermediate scheme is regular. |

## Required owner changes and resumption

These are requests for the maintainer to route, not claims that another
packet already exports them. The README's contract table is the exact
statement of each request; the source scopes there must be preserved.

1. **Crystalline/logarithmic direction:** extend the existing
   CrystallineCohomology Part II direction beyond
   `WV.4/hodge-witt-pushforward` where necessary. That node is about smooth
   schemes over a perfect field. Retain MEK §7.4's mod-p norm/trace
   compatibility and §§7.5–7.6's genuine Witt symbols; add only the
   finite-length trace/sheaf corestriction and geometric DVR/purity comparisons
   not supplied there. Shiho Theorem 3.2 gives the specified purity ranges;
   Theorem 5.4 is length one, and Remark 5.5 explicitly distinguishes the
   further finite-length comparison. An unrestricted excellent-regular
   all-length comparison needs an additional verified theorem, not a renamed
   Gersten exactness statement.
2. **Étale-duality direction:** extend the existing EDC Part II direction
   for the wild exceptional-pullback and mixed-trait coefficient object
   required by `mixedKatoDualizingComparison` and the wild variant of
   `KatoEtaleHomology`. EDC Part II EQ.6/EQ.7 use invertible coefficients.
   JSS §3 permits imperfect fields at points of X, while its base henselian
   mixed-characteristic trait has perfect residue field. No theorem over an
   imperfect-residue base trait was established. Keep higher-field conductor
   duality separate from this geometric extension.
3. **Geometric alteration direction:** route the degree-controlled extension
   of SchemeAndStackFoundations §4.19, with coordination with EDC Part II
   `EQ.2/prime-to-ell-local-uniformization` and
   `EQ.0/standard-form-covers`. SchemeAndStackFoundations Part II has no
   alteration node supplying this. The required result is a single proper
   surjective alteration with smooth source over a finite constants extension,
   both degrees prime to the chosen invertible prime, and SNC inverse boundary;
   proper X must give projective source. Ordinary de Jong alteration,
   AdicCoefficientsAndComparisons' proper hypercover descent and LPV's
   prime-to-degree purity descent do not assert this existence theorem.
4. **Ordering:** the checked maintainer global `ORDER.txt` allows main,
   other authors' PRs, and earlier suppliers; it inserts new roadmaps after
   their last supplier. HL, MEK, FFA and EDC Part II are absent. HL also has
   no assignment in the checked 94-roadmap Caraiani–Newton order. Do not
   invent a bundle or claim that absence proves a permitted order. The
   maintainer must assign HL and the unlisted required suppliers/extensions,
   after resolving their imports. The current order does place KTheoryLowDegrees,
   K2SymbolsBrauer, KTheoryFiniteLocalFields, CR, LPV and EDC in its explicit
   list; ordinary ClassFieldTheory is already on main.

The affected accepted target IDs have prefix
`HigherLocalFieldsAndHigherClassFieldTheory:`. R1 feeds
`HL.2/logarithmic-de-rham-witt-coefficients`,
`HL.2/norm-residue-and-the-symbol-identification`,
`HL.2/kato-residue-theorem-and-the-invariant-map`,
`HL.2/finite-coefficient-duality`,
`HL.4/kurihara-exponential-and-differential-forms`,
`HL.5/residue-maps-along-a-flag` and
`HL.7/motivic-residue-comparison`. R2 feeds
`HL.6/global-reciprocity-for-arithmetic-schemes`,
`HL.6/tame-and-wild-proper-and-open-variants`,
`HL.6/kato-complexes-and-boundary-square-zero` and the residue comparisons.
R3 feeds `HL.6/lgp-global-base`, `HL.6/lgp-good-model` and
`HL.6/kato-hasse-global-models`. Reconcile the relevant existing G03/G04,
G12–G15 obligations and requests only in an authorized packet job. The
packet's old generic-BGK, scheme-pi1 and nonexistent alteration-direction
descriptions must not override the corrected package supplier contracts.

## Touched-statement adversarial pass

Rows group an interface with all of its named fields and defining identities.
No Lean theorem signature, variable block, definition body or proved example
changed; the Lean edit updates its closing README-only inventory. The eleven
existing signatures retain the independent review's full pass.

| Statement or interface checked | Instances and computation | Result/change |
| --- | --- | --- |
| Absolute differentials, universal derivation and module completion | Zero module has zero completion; the unit ideal gives zero inverse limit. For I=(p) in a mixed DVR, I is principal and nonunit. | Cite existing `KaehlerDifferential`, `.D`, `.linearMapEquivDerivation` and `AdicCompletion`; do not replan these carriers. |
| `FiniteEtale U`, fibre functor, π₁, abelianization and basepoint change | Spec F_q gives the procyclic group and unchanged abelianization. Disconnected schemes require a groupoid; connected nonempty is explicit in the group assertion. | Import CE Layer 3 and PA, not SF's field-only comparison. |
| Branch-purity criterion | Purely inseparable F_p(u^(1/p))/F_p(u) has no codimension-one points but is not étale. Identity of a regular integral scheme meets the criterion. | Generic separability, normality, regularity and finite dominance remain explicit. |
| Invertible-coefficient absolute purity | Codimension zero gives identity; a trait closed point gives twist −1 and shift −2; a uniformizer's normalized residue is 1. Characteristic-p coefficients on a p-trait are outside the assertion. | Use LPV §0.10; distinguish branch and logarithmic purity. |
| EDC base dualizing object and coefficient scope | A field has no dimension shift; a trait uses constant Λ as its base object. Λ=Z/n is self-injective, including n=1's zero case. | The Kato shift belongs to this package, not to EDC's base object. |
| `logWittFieldTransfer`, including sheaf trace and H¹ corestriction | For v^p=u, restriction kills dlog u at length one, while the Milnor norm transfers dlog v to dlog u. At weight zero transfer multiplies by [L:E]. | Retain inseparable extensions, Witt length, base change, transitivity and projection formulas; no wild radicial invariance. |
| `logWittDVRComparison` and branch transfers | K=k((t)), unit u: the last-slot field map sends dlog u∧dlog t to dlog ū; integral-unit products have zero residue. Kato H¹ output weight i requires residue p-rank ≤i. | Explicit source/target degrees; transported field maps do not prove geometric comparison. |
| `logWittRegularPurity` | q=0 allows the source's weights; q>0 requires top weight N and the excellent finite-p-rank condition. Length one versus length two tests the differential-comparison claim. | Preserve Shiho's ranges; all-length Gersten exactness is not substituted for an all-length differential identification. |
| `mixedKatoDualizingComparison` | Generic restriction is μ_(p^s); exceptional closed restriction is Z/p^s[−2]. Constant μ_(p^s) on the whole trait loses the closed term. Test p=2 and imperfect point fields separately from the perfect base residue. | State the mapping fibre and JSS's exact scope; no general canonical-cone assertion. |
| Field invariant dependencies, §2.3 | A higher local field can have imperfect outer residue; F_p((u)) has p-rank one. Ordinary one-local invariant is the induction endpoint. | Use Kato's field conductor argument, not mixed-scheme purity. |
| Coefficient sheaves/shifts, §2.5 | At s=1, weight zero is Z/p in degree zero; weight i has shift −i. F_p((u))((t)) fails perfect-outer-residue scope; p=2 remains included. | Import CR's actual sheaves and MEK symbols, separating stronger comparisons. |
| Field dlog/norm/residue squares, §2.6 | dlog u≠0 on F_p(u), while ordinary μ_p has no such class. Degree-zero symbol is Z/p^s. {u,t} gives ū, and swapping entries changes the sign. | Keep independent cohomological carriers; distinguish field maps and geometric equality. |
| `KatoConductor.filtration`, `.monotone`, `.unramified`, `.annihilatesUnits` | Increasing i enlarges the coefficient bound and lowers the mixed unit index. On F_p((t)), t^(−i) pairs with 1+i⁻¹t^i to residue 1 for p∤i; depth i+1 gives zero. | Define T_i with i≥0; keep U^(i+1), not U^i. |
| `.gradedPairing` away from and at p-divisible levels | For p∤i use δ(w∧v); for p|i use the two closed-form quotients and δ(dw₁∧v₂+dw₂∧v₁). Negative differential degree is zero. | State the actual formulas, not an unspecified perfect pairing. |
| Terminal Cartier quotient and `.cyclotomicDescent` | At p=2 the terminal index is 2e. Nonintegral pe/(p−1) exhausts at its integer part. The constants extension has degree dividing p−1, also at p=2. | Retain terminal ν-factors and both unit quotients; no odd-prime exclusion. |
| `KatoConductorDuality` and `KatoCharacterDuality` | q=r=1 fits finite residue p-rank zero. The q=0 endpoint is outside Lemma 22 and uses the invariant. For k=F̄_p, H¹(k,Z/p)=0, so a generic finite-p-rank nondegeneracy claim would be false. | Nondegeneracy after final trace is stated for higher local towers with finite last residue field. |
| Completed differentials, §4.4 | q=1 gives degree-zero domain and scalar exponential; an infinite p-basis does not license commuting an exterior power with inverse limits. | Specify completed Ω¹ first, then its exterior powers, as in Kurihara. |
| `KuriharaExponential.map`, `.logGenerator`, `.integralGenerator`, `.continuous` | Nonzero nonunits enter the exponential argument through their product. A zero differential entry maps to zero without a symbol containing zero. At p=2 retain ord_p(η)>2; equality is excluded. | Add the general integral-generator formula, retain strict bound and ord_p(p)=1. |
| `.residue` and mixed-series scope | For E{{T}}, T is a unit for the outer mixed valuation; its T-residue is not the outer DVR boundary. The q=2 differential residue has degree zero downstairs. | Preserve the actual T-residue square and imperfect-residue source theorem. |
| Flag residues and geometric comparison, §5.4 | Every normalization branch is retained; unit classes extending over an open have zero residue. The two coordinate flags have opposite nonzero contributions. | Direct Milnor maps use K2; geometric equality uses the new niveau construction and the correct purity regime. |
| Scheme reciprocity dependencies, §§6.2/6.4 | Spec F_q gives finite-cover Galois theory; the dimension-zero inseparable counterexample rejects a vacuous purity test. Tame quotient still kills wild inertia curvewise. | Replace the incorrect SF fundamental-group/purity imports by CE/PA/PBL. |
| `KatoEtaleHomology.group`, `.properPushforward`, `.openRestriction`, `.localization` | A smooth d-fold over a field has H_a=H^(2d−a)(Λ(d)); on a trait its generic point has δ=1 and its closed point δ=0. Empty X and n=1 give zero. | Give field/trait definitions and the existing six-operation construction. |
| `.pointColimit`, `.fieldStalk` and dimension function | A trait's closed stalk is H^(−j)(s,Λ); its generic stalk is H^(2−j)(η,Λ(1)). Passing to an open retains δ, even when the open's Krull dimension changes. | Use trdeg plus dimension on the base; shrink excellent closures and apply smooth/regular-immersion purity. |
| `.niveau` and `.residueDifferential` | Support δ-dimension a gives E¹_(a,b), point exponent a−b and Kato row b=−1. Empty support gives zero exact couple. | Explicit support filtration and first-differential identification replace an unbuilt “arithmetic niveau” promise. |
| `KatoComplex.niveauSign`, `.niveauRow`, `.squareZero` | For χ∪u∪t, our degree-two t-residue is χ∪u and JSS d¹ is its negative. s₂=−1, s₁=s₀=1 make both consecutive squares commute. The two flag composites are +χ and −χ. | Specify JSS's connecting-morphism convention, d_Kato=(−1)^(a+1)d¹ and s_a=(−1)^(a(a−1)/2). |
| Milnor-row sign conversion | At degree one the Milnor uniformizer residue is +1, while JSS d¹ is −1. | The Milnor conversion is (−1)^(a(a+1)/2), distinct from the Kato row. |
| Wild homology variants, §6.5 | Finite-field base is perfect, including characteristic two; mixed base is henselian with perfect residue, though point fields may be imperfect. | Keep JSS 2.11.3/3.10.2 and the stronger owned export prerequisites; no arbitrary imperfect-base assertion. |
| `properPrimeToEllAlteration` | Identity of a smooth projective SNC pair has degree one, including empty boundary and dimension zero. An ordinary alteration of degree ℓ lacks the degree condition. | Specify constants and generic degrees, smoothness, properness and projectivity; mark the missing geometric supplier. |
| `HigherHasse.alterationDescent`, §§6.8/6.9 dependency | Factor F⊂F_s⊂F′ with F_s/F separable and F′/F_s radicial. Prime-to-characteristic restriction is an isomorphism on the latter; cor∘res is a prime-to-ℓ scalar on the former. Degree ℓ gives scalar zero mod ℓ and fails this argument. | Import PC/MEK maps and require compatibility at every place; no wild radicial invariance or new generic transfer theorem. |
| Local versus global alteration comparison | EQ.2 has regular sources in a covering family. EQ.0 has a proper intermediate Y without regularity. Composition does not place both properties on the same scheme. | Keep the exact global supplier requirement open. |
| Motivic flag comparison, §7.4 | {u,t} has positive last residue u, reversed entries give a minus, and ordinary μ_p cannot replace logarithmic coefficients. | Separate the BGK-transported field square from the stronger geometric flag comparison. |

The new homology, conductor and sign carriers are absent at the pins. Under
the binding 19 October headline/example rule they remain README targets and
the short closing Lean inventory; no fake integer sign exercise, weakened
cohomology signature, sorry'd data or admitted example was introduced.

## Sources and supplier evidence

All repository prose is in our own words. Printed page numbers are used;
JSS locators refer specifically to arXiv v1, not a later pagination. Read the
numbered statements and their surrounding hypotheses and the comparison
arguments relevant to these changes. This is not a claim to have read every
proof in every book or to have formalised the source theorems.

| Source/version | Portions used and read | SHA-256 of PDF |
| --- | --- | --- |
| [Invitation to higher local fields, 2000](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf) | Kato existence §5, especially Definition 14, Lemma 22 and Proposition 7, pp. 189–194; relevant norm/completion and residue discussion, pp. 181–188. Kurihara I §§9.1–9.2, pp. 91–93. | `a6c9088000d9b18ded4d2159531d7544683b86d6eecdbb2ab6cc9b743baabe62` |
| [Jannsen, Annals 183 (2016)](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p01-p.pdf) | Theorems 2.10–2.13 and the alteration/transfer argument, pp. 24–26. | `26dde9260f6475e4f6acbfbe651e18fac0d443a5f318fbf3974efc9f809f7d71` |
| [Kerz–Saito, Publ. Math. IHÉS 115 (2012)](https://www.numdam.org/article/PMIHES_2012__115__123_0.pdf) | Definitions 1.1–1.2 and Examples 1.4–1.8, pp. 129–134; Theorems 8.3–8.4, pp. 171–174. | `f4bb5f8b378c148f4b458b964f78761156255396e1bade5d7a11717fef2689e7` |
| [Dittmann–Pop, arXiv:2012.01307v2](https://arxiv.org/pdf/2012.01307v2) | §2 and Fact 2.3, pp. 4–5, to retain the characteristic-two scope. | `f9f26f7d8d6b5cb6bf86d04bf97f8f99069d8d676623cebe706e90ea8dcb2c1f` |
| [Morrow, arXiv:1204.0586v2](https://arxiv.org/pdf/1204.0586v2) | Relevant residue conventions, Proposition 5.5 and Remark 5.6, p. 33, and comparison discussion. | `c996cd77420a87bc1b657d7216f71f659f343cffe26046d171fade0eecf8b141` |
| [Kerz, arXiv:0907.5337v3](https://arxiv.org/pdf/0907.5337v3) | Scheme target and flag/class-group statements in §§3–5 and 9, pp. 4–7, 14–15. | `616fd1b1ce373cd9c5990228e4cce4248aac2c3f7fceb1ea6f6b2050db5d48d5` |
| [Shiho, JMS Tokyo 14 (2007), 567–635](https://www.ms.u-tokyo.ac.jp/journal/pdf/jms140404.pdf) | Introduction, pp. 567–571; coefficient/purity hypotheses in §2, pp. 575–582; Theorem 3.2 and its setup, pp. 583–584; Theorem 4.1, pp. 600–601; Theorems 5.2/5.4 and Remark 5.5, pp. 608–610. | `510b1918c021da4030ecf0f281ae7c90f1071c2f7eeebb5723c78ea1db9cdbad` |
| [Jannsen–Saito–Sato, arXiv:0910.3759v1](https://arxiv.org/pdf/0910.3759v1) | §§0.1–0.4, pp. 1–7; §0.6, pp. 8–10; Theorems 1.1.1/1.5.8, pp. 11–18; §§2.1/2.11, pp. 19–22, 31–32; §§3.0–3.4, pp. 33–37; §§3.9–3.10, pp. 43–46; Appendix A's trace comparison statements and arguments, pp. 57–62. | `ed4198bd4f019c5ee57cd629ea0e044553d2999226c3fa5fad3f3f768bbc2109` |

Read the actual relevant supplier statements, not just their titles:

- [ConstructibleEtale PR #196](https://github.com/TauCetiProject/TauCetiRoadmap/pull/196),
  Layer 3, head `4bd72379658126cbe9be935656396f0c9dac4de0`.
- [PurityOfBranchLocus PR #1103](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1103),
  §§0.1/2.2, head `6726bb6f42cdcfb40ddee74d6b1e22dfd04f1182`.
- [LPV PR #873](https://github.com/TauCetiProject/TauCetiRoadmap/pull/873),
  §0.10, including its expanded purity prerequisites, head
  `1b8f741b92693436a0dd0984a2c0c6ce7033a629`.
- [EDC PR #1040](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1040),
  §0.2's actual dimension-one base and biduality statements, head
  `9a0e8eeeb7bef06a13fdbda9d7c5551b368da248`.
- [CR PR #857](https://github.com/TauCetiProject/TauCetiRoadmap/pull/857),
  §§4.7–4.8, head `2c8b22a1737d1660f1baf397926b41e90139a80d`;
  current SF §4.19; ACC PR #965's proper-hypercover scope at head
  `726658cfc1bf5f2e08afa2e197cbbc5f0ecb37fa`.
- The accepted MEK package §§6.6, 7.4–7.6, K2's actual transfer/residue
  sections and the SF II, CR II and EDC II packets' pertinent nodes.

The current read-only roadmap checkout is
`0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Object searches in both
did not find a pre-existing Kato/niveau/logarithmic-purity carrier or a global
degree-controlled alteration target replacing these repairs. Current LFR,
Completed/RestrictedProducts, PA and LGG supplier/signature material and the
PadicMeasuresIwasawaAlgebras exemplar were read. The reviewed library audit
and all 85 accepted nodes were consulted; this run does not replace the prior
independent review of every unchanged target. Newly cited Mathlib Kähler and
completion statements were checked at pin
`082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti remains pinned to
`f790474821cf4256814db967cb154e7af3d0c369` for the Lean file.

## Verification and handoff boundary

- `lean-check` completed with exit 0: exactly eleven `declaration uses sorry`
  warnings and no other warnings/errors. Available memory was above 20 GB
  before compilation. No Lean server, Lake build/update/cache operation or
  parallel private build was started. The file has three real-bodied light
  definitions, five proved examples and eleven theorem targets.
- `scripts/check_blueprint.py` reports 0 errors and 0 warnings on the
  unchanged accepted packet: 85 nodes, 139 original API entries, 101 original
  Checks, 15 gaps, 27 requests, eight planned layers and zero closed layers.
  Passing validation does not certify prerequisite closure.
- Final intake, local-link/reference and whitespace checks are recorded in
  the pull request. Only README.md, Suggested.lean, review.json and this
  handoff are changed; metadata is unchanged.

The cleared-library index was read; no restricted source was required and
none was copied. Fetched source/PR material was treated as data; no
suspicious operational instruction was found or followed. No source passage
or section-by-section source summary is submitted. Scratch PDFs, extracted
text and logs are disposable; every fact needed to resume is recorded above.
Resume with the four owner/order actions, then recheck the downstream wild
and alteration dependencies before changing the verdict to accepted.
