# Handoff: PKG-NoncommutativeAndEquivariantIwasawa~codex

Author: Codex (GPT-6), session `codex-MyDvBs`, 2026-10-19. Refs #11067.

Claim: `/claim Codex — codex-MyDvBs`; bot confirmation [6277745262](https://github.com/CBirkbeck/tauceti-explorer/issues/11067#issuecomment-6277745262). This run claims only this job. Branch: `codex-MyDvBs-noncommutative-iwasawa`.

## Deliverable and coverage

The package has been rewritten in the required roadmap form. It retains all 136 accepted-plan targets: 133 numbered mathematical subsections, with three genuine duplicate targets supplied by existing roadmaps. The eight layers have 14, 14, 15, 14, 8, 8, 36 and 24 subsections. All 50 retained nodes classified as definitions/constructions have at least three discriminating prose Checks. There are 133 Checks lists with 448 bullets, seven additional supplier checks, eight layer example sections, eight dependency sections and all nine detailed worked examples. Hypotheses, API laws and locators remain in the README. Metadata remains `topic = "math.NT"`. The README is approximately 243 KB: the binding 2026-10-12 shape rule overrides the issue’s older size note, so theorem Checks and worked examples are retained rather than cut to reach 200 KB.

The pre-existing package was written under the separate Claude job #11082. This change is the separately assigned Codex package job, not a review of that worker. It corrects and rewrites that package, and does not modify the other worker's handoff, the accepted packet, its review or the campaign roadmap. The packet's 19 gap records and 28 requests are historical inputs, not records that this package job is authorized to close.

Suggested.lean now contains four real-bodied light definitions, five admitted theorem targets, one proved theorem and six proved examples. Its important untyped targets remain in the README and are named in the closing comment. Perfect-complex K-theory, noncommutative determinants and Bockstein carriers are absent at the pins; no fake carrier, weakened numerical replacement or admitted data definition was introduced to force their headline results into Lean. Their sign witnesses are fully computed in the README. Those witnesses cannot honestly be Lean examples of these absent carriers; the independent reviewer should check them mathematically, not mistake elaboration of the four light definitions for verification of the arithmetic theorems.

## Upstream and library audit

The supplied read-only roadmap checkout had HEAD `0d144d044dacebca17b654695b6f1ad58f159b27` on its integral-Hecke feature branch. Its cached main was `c785fa3b983754f0dbcc49492d92fd770e3adba6`. Live main was checked at `ebac59539c2db89dab1b8ec0a04e3f198edeacb3`; the intervening changed paths did not alter these suppliers. The directory was never updated and no Lake command was run there. Current Tau Ceti was audited at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; elaboration uses the prescribed older pins.

All target families were screened by mathematical objects and hypotheses against current roadmaps, including the nine post-snapshot roadmaps and Completed roadmaps, and against the current and pinned libraries. In particular: finite-index completed algebras, valuations and ordered coordinates; filtered transfer and global dimension; compact Tor/cohomology; Ore fractions; projective K0, noncommutative K1, relative triples and virtual determinants; representations, trace/norm and induction; arithmetic mapping fibres and duality; Hilbert q-expansions and measures; Bockstein/height/period data; reduced norms and Fitting ideals. A generic object with a similar name was not counted as supplying a missing comparison.

| Supplier inspected | Upstream PR head inspected | Contract or boundary |
| --- | --- | --- |
| CompletedCohomologyPartII #1035 | `1337958d2e3b2f68f5589ad3ef3c4ee2e71e0e10` | Uniform convention/open subgroup; locality, noetherianity, filtered transfer, uniform Auslander theorem, finite-index Frobenius Ext comparison. |
| GeneralAlgebraicKTheory #1212 | `67c1f583452d1a6cf255f200a2261340490fc894` | Resolution, relative triples, Waldhausen fibration and bounded-projective comparison; Ore-specific hypotheses and noncommutative determinant remain here. |
| AlgebraicKTheory #1142 | `7ecab00a30fddb0f594c087038b2c8242cd881c7` | Projectives, stable K1, Morita, congruence relative K1, semilocal units; congruence relative K1 is not silently a kernel. |
| SelmerIwasawaCohomology #869 | `691599e9863c501bbce9c0e3e3af6a61f7487613` | Greenberg conditions, mapping fibres, Iwasawa cochains, duality and conditional finiteness; new elliptic control/height adapters remain here. |
| ArithmeticGaloisDuality #858 | `567ff2b2099d724d7e75a37994ea44ba375f4a17` | Cohomological dimension, Shapiro and Poitou–Tate with twists/shifts/real terms. |
| PadicFamilies #1019 | `2a49b86f5509f46149b61ffd1caa18ea22071e03` | Integral Hilbert forms/q-expansions, not the full Deligne–Ribet or Colmez theorem. |
| PadicHodgeTheory #1062 | `b8552722d49ce2e33ef9e6628641b3bce04a5286` | De Rham/crystalline data, not the cyclotomic height theorem. |
| IntegralHeckeAndGaloisDeterminants #785 | `0d37c3f452ad9769ad7bfc257b5f283091814d85` | Reduced norms and determinant laws, not noncommutative Fitting invariants. |
| LocallyAnalyticDistributions #854 | `3f5c49bb724258dc3f78160af625ad2ce44d15fd` | Analytic manifold groundwork, not p-valued-group saturation. |
| ArithmeticGaloisRepresentations #856 | `7223685770e70f77bcc19dcea2dc78e3aca4112c` | §2.7 supplies Hecke functional equations and local constants. No Tate-thesis theorem is planned. |

Additional current supplier files read: PadicMeasuresIwasawaAlgebras, ProfiniteProPGroups, ProfiniteArithmetic, ProfiniteCohomology, ClassicalArithmeticCompletion, RepresentationTheory/InductionRestriction and SemisimpleAlgebras. Their exact consumed statements are recorded in the README supplier contracts.

Duplication removals and corrections:

- Accepted-plan filtered-transfer target (node 4) is supplied by CompletedCohomologyPartII §5.5, compact Nakayama (node 5) by PadicMeasuresIwasawaAlgebras §5.2, and two-sided noetherianity (node 10) by CompletedCohomologyPartII §5.1. These have no removal stubs in the README.
- Removed Lean definitions of generic closed powers/powerfulness/uniformity and a generic augmentation identity, because their owners already provide them. Only the extra uniform index criterion, coordinates and applications remain targets.
- Current `TauCeti.twistedMonoidAlgebra` already accepts a commutative semiring, with basis, `of_mul_of` and `isUnit_of`. The historical field-only extension request is obsolete. §6.7 adds only the Iwasawa carry cocycle and presentation.
- Current `TauCeti.fittingIdeal` is in `RingTheory/FittingIdeal/Basic.lean` (definition at line 343). It is not at the older pins; the commutative comparison cites current Tau Ceti and is not a new commutative Fitting construction or an invented Mathlib declaration.
- At the Mathlib pin, the class is `OreLocalization.OreSet`, with left fractions and the corresponding universal property. Abstract group cohomology and category-theoretic Tor do not by themselves supply continuous compact homology. Gamma values are available; the all-negative-integer residue target remains a theorem.

## Ownership moves and request resolution

No higher-roadmap citation is used as a missing supplier. The following notions are now explicit targets here; a higher roadmap can import their statements from the indicated subsections.

| Historical input or request family | Owner in this package / exact supplier |
| --- | --- |
| Analytic-group equivalence and finite-rank p-valuations/saturation formerly deferred to LocallyAnalyticDistributionsPartII | §§0.2, 0.5–0.7; generic analytic manifold machinery remains with its owner. |
| Compact homology, completed Tor and rational/twist comparisons | §0.14; not inferred from an unrelated discrete-cohomology connecting map. |
| Complete-ideal K0 and Cartan/character detection | §§2.1–2.3; base projective K0 from AlgebraicKTheory. |
| Ore perfect localization, noncommutative determinant, localized K1, comparison with relative triples | §§2.7–2.9; GeneralAlgebraicKTheory supplies its explicitly stated generic foundations. |
| Characteristic ideals and coefficient norms | PadicMeasuresIwasawaAlgebras §§4.2, 4.6; no duplicate target. |
| Morita, semilocal units and representation induction | AlgebraicKTheory A2/A4 and RepresentationTheory/InductionRestriction Layers 6–7; §§2.13, 3.14 verify localization/evaluation adapters. |
| Euler/Akashi identities formerly attributed broadly to IntegralIwasawaTheory | §§3.4–3.8, with boundedness, finite homology and dimension factors. |
| Generic Selmer construction and arithmetic duality | Exact SelmerIwasawaCohomology and ArithmeticGaloisDuality contracts; §§4.1–4.3 add elliptic control and named CM arithmetic inputs. |
| μ=0, arithmetic perfect model, weak Leopoldt, base change and real two-primary correction | §§4.4–4.8; no finite-global-dimension shortcut for p-torsion groups. |
| Normalized abelian determinant comparison formerly deferred to IntegralIwasawaTheory | §5.8; full period/Euler/twist data and p=2 real comparison remain explicit. |
| Deligne–Ribet functions, Wiles's normalized abelian theorem and Brauer construction | §§6.1, 6.19–6.22; PadicFamilies supplies only its actual Hilbert-form/q-expansion carriers. |
| Clifford/monomial reduction and Artin inductivity | RepresentationTheory/InductionRestriction plus §§3.14, 6.2–6.6 and 6.17–6.18. |
| Finite logarithm exact sequence, inverse limit, SK1 and completed RW construction | §§3.11–3.13, 6.11–6.16, 6.31–6.35; ClassicalArithmeticCompletion supplies its finite logarithm/determinant laws. |
| Abelian pseudomeasure limits and transfer | §§6.19–6.25, 6.31–6.36, with exact S,T, μ, dual-action and componentwise localization hypotheses. |
| Greenberg Artin p-adic functions, Colmez residue and Leopoldt | §§6.1, 7.11–7.14; SelmerIwasawaCohomology §4.18 supplies the Leopoldt proposition, not its proof. |
| Nekovář Bockstein height and period/regulator comparisons | §§7.15–7.18; generic Selmer fibres and de Rham objects retain their owners. |
| Reduced norms and Fitting-order extensions | Generic reduced norms from IntegralHeckeAndGaloisDeterminants; §§7.19–7.23 own the order, denominator and maximal Fitting constructions. |
| Completed coefficients/compact actions and generic twisted algebra | Current Tau Ceti/ProfiniteProPGroups and PadicMeasuresIwasawaAlgebras; cited once, not rebuilt. |

These group all 28 accepted requests by actual mathematical content. No request or higher roadmap was modified by this job.

## Source verification and limits

Public sources were retrieved as documents and read as data; no fetched code was executed. No suspicious instruction was encountered in an issue comment, another worker's PR files or a source. The source pass was targeted to the stated definitions, theorem statements and relevant arguments, not a claim that every cited book or every paper was read cover to cover. The twenty retrieved document versions are recorded below by URL and SHA-256 so this note survives scratch cleanup. Legacy source keys containing a year are identifiers, not bibliographic dates; in particular the Gambheera–Popescu document here is arXiv v1 from 2023.

Directly checked passages include CFKSV §§2–5 (canonical criteria, evaluation, Artin exponents, control and p. 200 CM argument); Ardakov–Brown §§2–5; Lazard's relevant group/algebra statements; Burns–Venjakob §§2–6 (determinants, Bockstein, Tate and Selmer shifts); Kakde §§2–6, especially p. 11, p. 14, Theorems 52–53, Definitions 69–70/73, Proposition 74, the p. 65 intersection argument and §§6.3–6.13; Schneider–Venjakob's explicit logarithm/comparison statements; Ritter–Weiss's main theorem, Möbius congruences, completed logarithmic argument and conditional 2026 SK1 reduction; Gambheera–Popescu's local, duality and μ-dependent comparisons; Nickel §§2–3, including the presentation-dependence example and annihilator theorem. Fu §4 and Pstrągowski §7 support coordinates and uniformity. Deligne–Ribet's scanned (0.1)–(0.5) and Theorem 8.2/Remark 8.4 at printed pp. 278–279 were viewed, not trusted to garbled extraction. Colmez §5, pp. 386–388, was read for the unconditional residue formula and its separate Leopoldt nonvanishing condition.

Cleared Schneider, *p-adic Lie Groups*, §§26–29, pp. 181–208, and Ribes–Zalesskii, *Profinite Groups*, Theorem 7.3.7(a), pp. 265–266, were read in the maintainer's library in place. No book files or passages were copied. No other copy of a restricted book was used.

The following boundaries matter to the independent reviewer:

| Historical gap / limit | Treatment and remaining limit |
| --- | --- |
| Uniform criterion and analytic boundary | Additional criterion/coordinates/valuation/saturation explicitly planned and checked against public notes plus cleared Schneider; generic uniformity stays imported. |
| CFKSV Proposition 3.11 and conductor-11 L-values | Numerical assertions are hypotheses, as the issue directs; this package does not certify external computations. |
| CFKSV CM/control arithmetic | Named targets now expose cyclotomic torsion, two-variable μ=0 and no-pseudonull inputs. Their use was checked in CFKSV pp. 199–201; original Rubin/Schneps/Ochi–Venjakob/Coates–Howson proof chains were not independently reread. |
| Oliver–Taylor and finite Whitehead theory | Exact finite formulas are explicit and the public Kakde/Schneider–Venjakob restatements were checked. Oliver's original restricted book was not accessed; its complete primary proof audit remains outside this source pass. |
| Fukaya–Kato foundational statements | Perfect-model, K1 continuity and determinant/localization comparisons are explicit targets, supported by the precise public Kakde/Burns–Venjakob formulations. The original Fukaya–Kato text was not read. |
| BV §6 and Nekovář | Every use has a named height, local ε, period or regulator target, or an explicit conjectural hypothesis. Nekovář's original book and FK's original ε formulations were not accessed. |
| Current suppliers versus pins | Exact current contracts and absent-at-pin carriers are stated; no promise that the current libraries are available in the old Lean build. |
| Ramified coefficient proof leaves | Separate ramified homological targets retained; only the unramified weighted-graded/logarithm formulas use the directly checked Schneider/Frobenius statements. Brumer's original proof was not reread. |
| Real p=2 | Actual unbounded Tate correction is planned. No odd-prime theorem or perfectness result is extended across it silently. |
| RW earlier work / SK1 | Public main/logarithmic statements were checked; not every prior-paper proof leaf was independently reopened. The universal cyclic-division SK1 premise remains conditional. |
| Abelian minus theorem | Exact S,T and covariant dual conventions retained; μ=0 is used only for the Tate-module identification/comparison, not smuggled into the unconditional abelian theorem. |
| Fitting foundations | Nickel's explicit definitions, maximizing-presentation result and annihilator theorem were checked. Foundational maximal-order/reduced-norm results are supplied targets, not independently reconstructed proofs. |
| Arithmetic semisimplicity / exceptional factors | Retained as hypotheses or separately named comparison targets; interpolation away from zero does not prove them. |
| Integrality evidence | The four assertions are conjectural and only supported implications are claimed. Kato's original integrality proof leaf is not claimed as read. |
| Noncommutative determinant / Ore localization | Missing adapters are owned here with precise hypotheses, not attributed to an abelian Serre-localization theorem. |
| Compact homology/control | Construction, continuity, derived Tor and control inputs are explicit targets. Compact/discrete and algebraic/completed tensor conventions remain separate. |
| Twisted coefficients | Historical gap removed by checking the actual current commutative-semiring carrier. Only the carry presentation is new. |
| Uniform smoothing | §§6.21/6.24–6.25 retain the quantifier difference: fixed g for every ε versus a conductor-dependent g. The README uses the full RW analytic Möbius theorem and independent completed construction for the main-conjecture route; it does not infer uniform g by compactness or by taking g→1. §6.25 explicitly names the uniform smoothing assertion as an additional target. A proof audit repairing the apparent quantifier passage in Congruences II pp. 6–11 is not claimed; the independent reviewer should inspect that source boundary. |
| Wiles abelian theorem | Official theorem metadata and Kakde §3 p. 14's exact normalized restatement were checked. The original Annals proof was not retrieved/read. The theorem is an explicit target here, with divisibility inputs, not an unsupported supplier shortcut. |

Thus the package is a complete statement-level roadmap, with source/proof-access limits exposed here; it is not a proof or a declaration that the packet's historical gaps have all been closed. No arithmetic conjecture is promoted to a theorem.

### Public document versions

| Document identifier | Retrieved version | SHA-256 |
| --- | --- | --- |
| CFKSV-2005 | https://www.numdam.org/article/PMIHES_2005__101__163_0.pdf | `c0955aa2b2f15cfc68f9e136cccae41d71935bb3b2b0566ecea6021fcd074b47` |
| ARDAKOV-BROWN-2006 | https://arxiv.org/pdf/math/0511345v1 | `a665d599485fdbf33a550393731f51fdf733bbd0d5be5c71e443e55ae8d81668` |
| LAZARD-1965 | https://www.numdam.org/item/10.1007/BF02684303.pdf | `b0b50cf55528fd4abb94f9e1de10b23f0711c0dd804682a9853b70b3b378f380` |
| BURNS-VENJAKOB-2006 | https://arxiv.org/pdf/math/0511672v2 | `4b33fb11251340c88a8f8a590d9f9296a413aadf4fae98968ea7191a14c857bc` |
| KAKDE-2011 | https://arxiv.org/pdf/1008.0142v3 | `5a05da0d58f2717422fb401510d9cad4aeeac707313929a796870b92e27ea45c` |
| SCHNEIDER-VENJAKOB-2010 | https://arxiv.org/pdf/1006.1493v1 | `dda52df49265b1c8859b00eb6c181cf23e10a205874bb7d416a591e5daa06cc1` |
| VENJAKOB-2002 | https://arxiv.org/pdf/math/0106269 | `e0941131157703e16013f02b65a046a3f6051ec92b7efe061006eff71b8d0f64` |
| FU-2024 | https://arxiv.org/pdf/2201.11190 | `d71e9d3f8d3a1217743c3ba72c9a9630981f054ecefd943ff4edb4879b842614` |
| CDT-2025 | https://www.math.uchicago.edu/~fcale/papers/UDC.pdf | `867026fbcc5592728173e5c4d6a87f58d57a55b0d0d8b0109b9774e84290ee1e` |
| RITTER-WEISS-2010 | https://arxiv.org/pdf/1004.2578v2 | `48811a99c75f3b826f2315cc914563ffab1dd98381fd0af141816e05b99f2dee` |
| RITTER-WEISS-2026 | https://arxiv.org/pdf/2608.22601v1 | `546d7dd0efb4d7563cc7048d31338c656cd74a92e5c3a4d0f4c7a3f7dca80ec9` |
| GAMBHEERA-POPESCU-2025 | https://arxiv.org/pdf/2303.13603v1 | `ff36bc77629fc5e8eed142145839ca1c137d78a5e942ea037e0a537f7d5f9d2d` |
| NICKEL-FITTING | https://www.unibw.de/timor/mitarbeiter/mitarbeiter/univ-prof-dr-andreas-nickel/nickel/fitting-survey.pdf | `50cd354a51d4904aef5c20b68d6b9cdbebd9d9152b6d7e6630b6440cc0ea32d8` |
| BERGER-PADIC | https://perso.ens-lyon.fr/laurent.berger/articles/article05.pdf | `9a892282543055b0b3e038286cdefd5803eb3b0effe4bc3a093748127fe3ebbe` |
| SCHNEIDER-VENJAKOB-AFTER-KAKDE | https://www.mathi.uni-heidelberg.de/~otmar/papervenjakob/congruences-final.pdf | `f7c8aefc73f2971a0d1f0615875d2c5d768467f2e1eee9ce09a5c8d795979555` |
| RITTER-WEISS-CONGRUENCES-II | https://arxiv.org/pdf/1001.2091v3 | `1c913044df7114503971621876f7c3268791ce38a19c891c0c8a854538df57d1` |
| VENJAKOB-COMPARISON-2011 | https://www.mathi.uni-heidelberg.de/~otmar/workshopms/RitterWeiss.pdf | `a0bc17a5fafd4258009d7f5d75970d4f7cbd6a0ccef7f169382cf356a7968a8f` |
| PSTRAGOWSKI-2023 | https://www.kurims.kyoto-u.ac.jp/~piotr/291y_notes.pdf | `33b64be42ac6a68e4438eb7d927b2d8a6cb9b5e6364d96070449e9205a567f52` |
| DELIGNE-RIBET-1980 | https://math.berkeley.edu/~ribet/Articles/deligne-ribet.pdf | `4ff26bab2723a01434e6ee4066d0b0907d6bb5540e2bf78b02a11a86d84d0a2b` |
| COLMEZ-1988 | https://webusers.imj-prg.fr/~pierre.colmez/residu.pdf | `323204a0c42935dd9668b5d388083726cc005eca03f3c3df7023ebfeb313746e` |

## Adversarial mathematical pass

The table covers every retained numbered subsection. Instances are symbolic computations or checks of the actual source hypotheses; a row about a conjecture tests its definition/scope and does not verify the conjecture. The README contains the resulting discriminating Checks and the two-term normalization witnesses. Global exclusions were applied throughout: noncompact groups are outside the profinite/compact assertions; equal-characteristic DVRs and characteristic-p coefficient fields are outside the integral/rational p-adic statements; ramified coefficients are outside the specified Frobenius logarithms; p=2 real terms and odd-prime analytic congruences are separated. F_2 is allowed in the mod-p/locality tests, and the trivial group, zero module, rank 0, unit ideal, q=1 and inputs beyond q are explicitly tested where those expressions occur.

| README statement | Instances tried | Result / correction |
| --- | --- | --- |
| §0.1 | U=1; Z_p^d; C_p; p=2 | Dimensions 0,d; C_p fails torsion-freeness. Fourth powers retained at 2; only the additional index criterion is new. |
| §0.2 | finite groups; Z_p; infinite product of C_p; Q_p additive | Finite groups have dimension 0; the infinite product fails finite rank, Q_p fails compactness. Added the analytic-chart comparison. |
| §0.3 | H=H′; Z_p/pZ_p; S_3×Z_5 | Ranks 1,p,6. Noncommuting transpositions prevent a commutative crossed-product claim. Fixed left basis H′g/right basis gH′. |
| §0.4 | G=1,C_p,C_2 at odd p | Coefficient ring, local modular group ring, product of two local rings. Added semilocal extension and locality converse. |
| §0.5 | d=0,1,2; nonabelian uniform semidirect product | Empty product is 1; additive coordinates agree with Z_p^d. The ordered homeomorphism is not generally a group map. |
| §0.6 | p odd versus 2; element of order p; valuation threshold | Weights 1 versus 2; p-torsion contradicts the exact power identity. Added saturation and strict root threshold p/(p−1). |
| §0.7 | U=1,Z_p; coefficients π^(−n); ramified O | Constants and usual series recovered; unbounded denominators excluded. Restricted the weighted graded formula to unramified coefficients. |
| §0.8 | d=0; p=2; aba^−1=b^(1+p) at odd p | Mod-p graded algebra is polynomial; integral maximal-ideal graded algebra has AB−BA=PB. Added stronger integral commutator hypothesis. |
| §0.9 | G=1,C_p; M=0 and π-killed M | No-p-torsion hypothesis retained; zero has grade +∞ and dimension −∞. Added grade shift for π-killed modules, not arbitrary reduction. |
| §0.10 | G=1; Z_p^d; C_p; ramified O | Global dimensions 1,d+1; C_p excluded. Ramification handled by its own coefficient-DVR argument. |
| §0.11 | G=1,Z_p; K⊗O[[T]] versus K[[T]] | Dimensions 0,1. Bounded-denominator rationalization retained; formal K-series are a different ring. |
| §0.12 | U=1,Z_p^d; p=2; nontrivial mod-p action | Exterior dimensions choose(d,i), vanish above d. Uniformity and trivial residue coefficients retained. |
| §0.13 | trivial rank 1; rank 0; direct sum; character a | Trivial twist is identity, rank 0 gives zero, sum distributes; diagonal action uses a rather than a^−1. |
| §0.14 | H=1,Z_p; M=0; rational trivial coefficients | Coinvariants and two-term completed bar model agree; homology above analytic dimension vanishes under the stated hypotheses. Added compact Tor and twist adapters. |
| §1.1 | B=A; Z_p[[T]], H=1; zero/unit | For B=A, 0 belongs; in the Iwasawa case T belongs and p does not. Abstract set and group-specific regularity separated. |
| §1.2 | G/J=Γ; finite quotient factor; noncentral subgroup | A suitable p-power of a cyclotomic lift centralizes the finite factor. Centrality is proved, not assumed of every lift. |
| §1.3 | G/J=Γ; finite p-group factor; zero divisor | V=F_p((T)) in rank 1; finite algebra need not be a field. Unit criterion uses multiplication on the whole algebra. |
| §1.4 | f=1,T,p in Z_p[[T]] | Quotients are 0,Z_p,F_p[[T]], respectively. Only the first two are coefficient-finite; left multiplication direction fixed. |
| §1.5 | same abelian test; opposite noncommutative ring | Right criterion agrees in the abelian case and is transported through the opposite ring, not through a commutative shortcut. |
| §1.6 | M=0; R/(T); R/(p); free R | First two are S-torsion, the last two are not. Finite generation and canonical S-torsion are equivalent in the stated category. |
| §1.7 | f=1,T,p; group with p-torsion | Multiplicative closure uses compatible B-action; regularity/Ore are group-specific. No no-p-torsion assumption inserted into the canonical theorem. |
| §1.8 | identical levels; finite p-group augmentation kernel | Identity kernel is zero; finite p-group augmentation kernels in characteristic p are nilpotent. Infinite augmentation ideal is not used. |
| §1.9 | F_p[[T]]; F_p[C_p][[T]] | Nonzero series are regular in the domain case; finite p-group radical is retained in the second case. Reduction uses the prime radical. |
| §1.10 | n=0; p·1; T; ramified O | S is contained in S*, p is in S* but not S. π-saturation and p-saturation yield the same localization, not the same displayed union. |
| §1.11 | unit denominators; Γ case; product coefficients | Universal property is for left fractions. Canonical, saturated and total quotient rings remain distinct; products are componentwise. |
| §1.12 | M=0; S-torsion M; free module | Localization kills precisely S-torsion; both required flatness directions use the appropriate left/right convention. |
| §1.13 | M=0; R/(p); R/(T); free R | p-primary torsion is allowed in MH, free R is not. Serre closure does not assert finite projective dimension. |
| §1.14 | zero complex; [R→R] via 1,T,p | Identity is acyclic; T is S-acyclic, p only S*-acyclic. Kept bounded perfect complexes rather than all torsion modules. |
| §2.1 | I=0; complete radical ideal; nonradical ideal | Identity case agrees; idempotent lifting needs completeness and I⊆Jac(A). Added the actual lifting target. |
| §2.2 | J=1; finite p-group quotient; projective rank | Identity and residue rank detection agree. Injection is through projective K0, without identifying all modules with perfect objects. |
| §2.3 | matrix algebra over a finite field; trivial simple; modular representations | Projective coordinates use Brauer/Cartan detection and the correct simple/contragredient factors. Added Cartan injection. |
| §2.4 | H=1,Z_p; M=0; p-primary torsion | Homology remains finitely generated in the stated torsion category; boundedness needs no p-torsion. No unconditional Euler product. |
| §2.5 | rank 0,1; direct sum; stable O-lattice | Zero and identity twists preserve MH; finite-free extension and diagonal action give the general result. |
| §2.6 | Γ; S versus S* | S-localization is semilocal; the same conclusion is not asserted for S*. Removed the overbroad localization argument. |
| §2.7 | identity quasi-isomorphism; zero object; shift | Noncommutative virtual Picard determinant and localized K1 are new carriers. Added base-change and composition contracts beyond commutative lines. |
| §2.8 | identity triple; [R --T→ R]; shifted complex | Zero class for identity, opposite classes for shifts. Added relative triples/perfect comparison with positive boundary. |
| §2.9 | S={1}; T localization; p-torsion in G | Identity map has zero relative group. Verified targets include Waldhausen hypotheses; arbitrary torsion modules are not substituted. |
| §2.10 | T on R; [R --T→ R] in degrees −1,0 | ∂[T]=[R/T]; BV characteristic map of that two-term complex is T^−1 and has boundary −[R/T]. |
| §2.11 | zero relative class; R/(T); no-p-torsion G | 1 and T lift the first two; module resolution argument is restricted to finite projective dimension. |
| §2.12 | M=0,R/(T); multiplication by an integral unit | Characteristic elements 1,T have the positive module boundary. Unit ambiguity remains explicit; zero complex does not select a unique element. |
| §2.13 | local ring; S localization; S* localization | Semilocal units surject onto K1, without injectivity. S* case uses its separate CFKSV argument. |
| §2.14 | R/(T), R/(p), 0; shifts | Characteristic series have their usual divisors. S and S* differ; module and cohomological-complex signs are distinguished. |
| §2.15 | G with order-p elements; perfect arithmetic complex | Boundary surjectivity remains a perfect-complex statement and does not claim every torsion module has a finite projective resolution. |
| §3.1 | trivial rank n; rank 0; character γ↦a | Scalar u evaluates as u^n; zero-rank twist is separately defined. Morita determinant is not divided by n. |
| §3.2 | T,p and a(1+T)−1 | Representation maps carry the designated denominators to the rational target. Augmentation is not asserted on a pole. |
| §3.3 | T,T^−1; (T−a)/(T+b); p=3,a=4,b=7 | Values 0,∞ and −4/7. Rational cancellation precedes evaluation; 0/0 is never assigned a value. |
| §3.4 | H=1; zero module; G=C_p×Γ, M=F_p | Alternating characteristic series agree in bounded cases; C_p homology is unbounded and excluded from the finite product. |
| §3.5 | H=1; trivial character; degree shift | Evaluation and characteristic series agree with the same twist and alternating exponent. Sign agrees with the two-term boundary witness. |
| §3.6 | R/(T−a), a≠0; T=0; a=0 | Finite Euler characteristic has the expected |a| factor; a=0 gives infinite coinvariants and is excluded. |
| §3.7 | zero module; Artin direct sum; vanishing denominator | Value is a unit only under the specified finite homology hypothesis. Artin evaluation does not automatically imply integrality. |
| §3.8 | trivial group; matrix block of dimension n; finite regular representation | Artin exponent is dim_L ρ; Morita removes the block matrix size in K0, without deleting the exponent from Euler cardinalities. |
| §3.9 | χ=5^4,5^16,5^8; dimensions 3,4,4 | Valuation difference gives 3 and 1 after the stated dimension factors. Arithmetic numerical inputs remain hypotheses. |
| §3.10 | zero module; unit; p and T; character a | Four assertions are conjectures and implications, not a proved equivalence to existence. Twisted T is a(1+T)−1. |
| §3.11 | trivial group; finite p-group levels; rational total quotient | Integral inverse-limit SK1 and rational reduced Whitehead kernel are distinct. Quotient by the former does not prove vanishing of the latter. |
| §3.12 | Γ; finite p-group×Γ; higher-dimensional G | Open central Γ0 gives finite semisimple total quotient with centers retained. General higher-dimensional G is excluded. |
| §3.13 | split matrix algebra; division component; localization kernel | Determinant detects reduced norm after splitting; residual SK1 and kernel of localization-to-total-quotient remain. |
| §3.14 | trivial rank n; direct sum; index-two induction; quotient inflation | Values multiply, scalar gives u^n, transposition gives −1. Named denominator-preserving hypotheses added. |
| §4.1 | CM/non-CM; p=3; arbitrary algebraic tower | Dimensions 2/4; order-3 matrix explains p≥5. Finite generation restricted to compact Lie Galois towers with finite ramification. |
| §4.2 | X=0; X free; CM specialization | Zero satisfies both torsion predicates, free Λ(G) does not. Arithmetic conjectures stay named propositions. |
| §4.3 | X(p)=0; CM pro-p base; isogenous curve; conductor-11 case | Control, μ formula and three CM inputs are explicit additional targets. Numerical conductor-11 assertions remain hypotheses. |
| §4.4 | F∞=Fcyc; finite extension; full roots of unity tower | Cyclotomic tower qualifies; finite tower fails containment, full roots-of-unity tower fails total reality. Quotient/base-field maps named. |
| §4.5 | cyclotomic tower; H0=Z_p; G with p-torsion | Class is [Z_p]−[X] where module classes exist. Separate arithmetic perfectness and weak-Leopoldt targets prevent a false finite-global-dimension inference. |
| §4.6 | finite-level T=Z_p(1); zero local terms; duality shift | Compact support is a fibre, and Poitou–Tate has [−3] and an involution. Added explicit comparison rather than identifying unshifted complexes. |
| §4.7 | zero complex; p-torsion G; μ=0 cohomology | Bounded finite cohomology implies perfectness only with finite global dimension; dedicated arithmetic model covers the other case. |
| §4.8 | p=2 and a real place; odd p; no real places | Real Tate cohomology is Z/2 in infinitely many degrees. No finite perfect replacement is claimed without vanishing hypotheses. |
| §5.1 | trivial ρ; rank 0; local unit root | Interpolation retains both (1−u^−1) factors, extra removed factors and periods. Existence and K1 uniqueness are separate. |
| §5.2 | change characteristic element by K1(Λ); zero module | Main-conjecture membership is well-defined modulo the stated unit ambiguity; not an unnormalized equality of ideals. |
| §5.3 | assumed main conjecture; finite Euler characteristic; zero/pole | Consequences retain all main-conjecture and finiteness hypotheses; no evaluation at an undefined value. |
| §5.4 | three conductor-11 curves at 5; assumed L-values | All analytic/numerical inputs are hypotheses. Consistency checks do not certify those computations. |
| §5.5 | cyclotomic abelian G; trivial Artin character; p=2 | Boundary −[C] and K1′ uniqueness retained. Odd-prime theorem does not include real two-primary arithmetic. |
| §5.6 | empty allowed set; fixed periods; nontrivial evaluation kernel | Contract records existence separately from uniqueness; quotient uniqueness requires killing the common boundary/evaluation kernel. |
| §5.7 | identity norm/quotient; induction; Euler-factor change | Identity maps agree; general maps require compatible complexes, denominators and normalized values. |
| §5.8 | abelian Γ; trivial character; real p=2 comparison | Normalized functions, not just characteristic ideals, are compared. All-prime minus comparison requires its own perfect-complex identification. |
| §6.1 | trivial/nontrivial ψ; μ present; prime-to-p factor | Nontrivial numerator and trivial T-denominator distinguished. Added rationality, Kummer, abelian divisibilities and Brauer-induction targets. |
| §6.2 | single quotient; compatible family; nontrivial SK1 ambiguity | Patching includes the compatibility and uniqueness quotient; no arbitrary family is silently liftable. |
| §6.3 | already dimension 1; normal quotient in H | Reduction is identity in dimension 1; admissibility, μ and arithmetic base change are retained in quotient steps. |
| §6.4 | cyclic group; elementary subgroup; coefficient extension | Induction is applied with its actual character coefficients; rational induction is not replaced by integral induction. |
| §6.5 | l≠p; trivial prime-to-p factor; cyclic factor | Decomposition and norm maps preserve the indicated factors; arguments using l≠p are not applied at l=p. |
| §6.6 | prime-to-p cyclic factor Δ=1; nontrivial Δ | Unramified coefficient factors are split componentwise before pro-p algebra; no domain claim for an unsplit product. |
| §6.7 | q=1; a,b≥q; q=9,a=1,b=8 | Carry 0 at q=1, periodic in inputs, inverse pair carries once. Generic twisted algebra already exists over CommSemiring. |
| §6.8 | trivial P; index-p pair; p=2 toy model | All M1–M4 retained, including η_1=id. Four norm toy computations distinguish transfer/Frobenius and moduli; theorem still odd-primary. |
| §6.9 | identity element; generator versus non-generator; trivial P | Trace and generator projection are separated; additive A1–A3 retain their index factors and η normalization. |
| §6.10 | trivial finite quotient; one conjugacy class; coefficient base change | β is an isomorphism onto the exact A1–A3 image, not onto an unrestricted product. |
| §6.11 | I=0; x=1; 1+pX; ramified coefficient | Zero and identity logs are 0; Frobenius/log formulas require the specified unramified coefficients and convergence ideal. |
| §6.12 | finite G; G=Γ; x=1; Frobenius on T | Finite exact kernel/cokernel and inverse limit added. Kernel includes G^ab, not only its torsion subgroup; Defs 69–70/73 and Prop 74 locators corrected. |
| §6.13 | x=1; trivial P; finite norm | Both logarithmic sides vanish at 1; the nontrivial identity retains Frobenius and transfer corrections. |
| §6.14 | identity tuple; μ(O) and G^ab kernel terms | Exact multiplicative sequence retains both kernel factors and the stated cokernel; no cancellation of infinite Γ^ab. |
| §6.15 | trivial quotient; compatible versus incompatible norm tuple | θ image is exactly Φ; logarithmic comparison alone does not replace the finite kernel/cokernel argument. |
| §6.16 | integral unit; trivial group; p denominator | Integral injection is on K1′ with its specified SK1 quotient; it is not arbitrary K1 injectivity into a total quotient. |
| §6.17 | trivial Artin character; induced monomial character | Normalized values and boundary both enter the criterion. Twisting to kill central Z uses the actual one-dimensional character. |
| §6.18 | P=P′; conjugation by 1; induced character | Norm and conjugation formulas reduce to identities and preserve the same Σ-truncation. |
| §6.19 | Q, Σ={3}, k=2; ε=0; u=1; odd k | Values 1/6,0,0; odd k≥3 vanishes. Added rationality/Kummer/measure targets with actual Deligne–Ribet locators. |
| §6.20 | j=0; identity smoothing; two admissible weights | Finite group-ring approximations agree with the smoothed value and are weight-independent in the limit; coefficient powers κ(x)^−k retained. |
| §6.21 | fixed g; varying ε; finite trace quotient | Fixed-g-for-all-ε premise retained. It is not inferred from conductor-dependent choices or compactness at g=1. |
| §6.22 | extension degree 1; U_1; Q,k=2, p=3 truncation | Restriction/U are identities; constants −1/24 before truncation and 1/12 after. Added cusp/trace/norm formulas. |
| §6.23 | maximal cyclic P; P=1; proper normalizer subgroup | Transfer misses generators only under the maximal cyclic and proper-overgroup assumptions; impossible boundary cases excluded. |
| §6.24 | C_3×C_3; C_9×C_3; conductor-dependent g | Full Möbius norm sum is 486≡0 mod 9; an unweighted cyclic-overgroup sum can be 3ζ, not 0 mod 9. Quantifiers fixed. |
| §6.25 | Q=1,C_p; unramified coefficient products | Full analytic Möbius theorem gives zero for Q=1 and the transfer congruence for C_p. Central/canonical denominators treated componentwise. |
| §6.26 | bar G=1; nontrivial cyclic P; P=1 | Auxiliary group is finite after quotient by Z. Corrected notation so i_P and |Ḡ̃| are finite; P=1 has its separate trace formula. |
| §6.27 | b integral; change f by integral K1; product O | Subtracting the characteristic lift leaves integral abelian units; intersection and θ-lift preserve boundary. No unproved ℧=−[C] identification. |
| §6.28 | trivial P; all finite levels; wrong cyclic-only sum | M4 uses full Möbius plus completed construction and canonical descent; removed the invalid cyclic-only shortcut. |
| §6.29 | original/enlarged extension; quotient descent | All four conditions are proved on the same normalized tuple, with the completed-to-canonical step explicit. |
| §6.30 | cyclotomic abelian case; p-torsion in G; p=2 | General admissible μ=0 theorem has K1′ uniqueness and boundary −[C]; no no-p-torsion restriction added, p=2 excluded. |
| §6.31 | abelian G; x=1; completed coefficients | Logarithmic pseudomeasure uses the completed additive quotient and trace isomorphism; it is not an integral K1 element by definition. |
| §6.32 | Q=1,C_p,C_p^2; unit 1 | Full subgroup-poset Möbius coefficients, not cyclic-only coefficients, govern the algebraic and analytic trace congruences. |
| §6.33 | abelian G; torsion determinant discrepancy | Integrality criterion explicitly includes the torsion-congruence step. Logarithmic equality alone does not eliminate torsion. |
| §6.34 | μ=0 versus unknown μ; nontrivial SK1 | RW proves existence with refined boundary, not uniqueness. Its completed preimage feeds canonical descent without replacing the refined class. |
| §6.35 | split components; unknown division-algebra SK1 | Universal cyclic-division SK1 premise stays conditional; source does not prove it unconditionally. |
| §6.36 | abelian CM; p odd; μ unknown/zero; local S,T conditions | All-prime abelian minus result has its exact covariant dual and local hypotheses. Tate-module identification is only asserted with μ=0. |
| §7.1 | θ=0; γ normalization; right representation action | Zero extension gives zero Bockstein; right column action is transpose with reversed multiplication. Cup-product extension, not arbitrary degree-one map. |
| §7.2 | T,T^2; direct sums; shifts; two different degrees | T block is semisimple; T^2 is not. Direct-sum/shift closure retained; false extension closure removed. |
| §7.3 | zero complex; T block; nonzero scalar Bockstein | Trivialization comes from the actual acyclic Bockstein complex; inverse/shift and alternating determinant follow that construction. |
| §7.4 | C=[R --T→ R], ε/T; shift | Order −1, leading coefficient ε(0); shifted inverse has order +1 and coefficient ε(0)^−1. Monoidal inverse direction fixed. |
| §7.5 | T^m u, m=0,±1; zero rational function | Order and leading coefficient only defined for nonzero rational functions; ordinary value and nonzero leading coefficient differ at zeros/poles. |
| §7.6 | trivial rank n; matrix scalar; zero/pole at augmentation | Morita determinant, not matrix-entry evaluation, determines the Laurent coefficient. Equality to ordinary value restricted to order 0. |
| §7.7 | γ→γ^u; r=0,±1; p=2 finite sign factor | cγ changes by u, T-leading coefficient by u^−r. Nonvanishing cγ stated; negative orders use Laurent coefficients. |
| §7.8 | acyclic specialization; finite torsion homology; infinite homology | Generalized Euler characteristic uses finite Bockstein homology and the stated alternating cardinalities; no infinite product assigned. |
| §7.9 | shift C[1]; zero object; nontrivial determinant scalar | Global zeta arrow 1→d(C)^−1 becomes a trivialization for C[1], not an ordinary reversed arrow for C. ETNC remains conditional. |
| §7.10 | rank-one Tate block b=−ℓ/cγ; trivial representation | Bockstein is −log/norm scalar with cγ retained; Leopoldt is used exactly for the nondegeneracy assertion. |
| §7.11 | trivial/permutation characters; vanishing regulator | Artin p-adic L-function and regulator comparison are named targets; quotient only defined when its denominator is nonzero. |
| §7.12 | Q; totally real field with/without Leopoldt | Colmez residue formula is unconditional; nonvanishing is equivalent to Leopoldt. Discriminant square root and regulator sign remain linked. |
| §7.13 | cγ=5, ℓ=7, scalar 11; shifted Tate block | For determinant scalar 11, LT=55/7 and cγ^−1 LT=11/7. The separate worked example takes complex factor 11 and regulator 7, hence determinant scalar 77, LT=55 and normalized value 11. Shift gives a pole; γ→γ² preserves the normalized coefficient. |
| §7.14 | Q-valued rational character; Q_p-valued-only character; n=1 | Rational Artin induction scope retained. Formula for a positive power n does not delete possible root-of-unity ambiguity. |
| §7.15 | j=3,0,−2; local ε at a fixed measure | Γ*=2,1,1/2; negative integers use residues. ε and period factors retained; local constants consumed from ArithmeticGaloisRepresentations, not Tate-thesis theorems. |
| §7.16 | ordinary good reduction; Tate curve; A1/B1/C1 | Tate curve satisfies B1 but fails C1. D_dR and filtration/twist normalization explicit; Selmer complexes are actual mapping fibres. |
| §7.17 | height nondegenerate/degenerate; ramified finite places | Semisimplicity equivalence retains A1,C1,D2 and ramification error triangles. Height is a new Bockstein/duality construction with its sign comparison. |
| §7.18 | height rank h=0,1; b=7, scalar 11 | Shifted Selmer order is +h; h=1 gives −77. Four period/regulator definitions and D1/D2 comparisons explicitly retained. |
| §7.19 | M_2(Z_3); Z_p[C_p]; commutative Z_p[[T]] | Ambient characteristic-zero algebra, not modular reduction, must be separable semisimple. Finite-over-center and matrix-size-zero norm 1 retained. |
| §7.20 | commutative/maximal orders; dihedral group order | H=I=center in the first cases. Dihedral reduced norm need not be integral central; denominator ideal is necessary. |
| §7.21 | Z_3/9; free nonzero M; zero module over M_2(Z_3) | Invariants (9),0,unit ideal. Two-block determinants 15,24 give 3Z_3 for one presentation, identity gives the maximal Z_3. |
| §7.22 | injective square h=p; h invertible; reversed zeta boundary | Fitting invariant nr(h)I has positive module boundary. A zeta element with negative boundary must be inverted. |
| §7.23 | commutative order; zero/free module; nonintegral norm | H·Fitt lies in the integral central annihilator; raw nonintegral reduced norms are not asserted to annihilate. |
| §7.24 | E=T^e v, g=T^m u; e,m=0,±1; nonsemisimple T^2 | Orders add and leading coefficients multiply. Identification with Bockstein determinant requires semisimplicity and the actual local factorization. |

The three omitted duplicate targets were also checked: complete-filtered transfer uses the complete/separated and noetherian graded hypotheses (zero ring/ideal and incomplete polynomial ring distinguished); compact Nakayama is a topological finite-residue local-ring theorem (zero module versus a noncompact algebraic module); noetherianity uses compact finite-rank analytic groups, not an arbitrary infinite product of C_p. Their actual suppliers remain in the opening contracts.

Lean/prose generality agrees for the four kept definitions: `canonicalSet` is the abstract ring/module quotient definition with its compatible scalar tower, with Iwasawa conclusions as separately scoped theorems; saturation is the set for a selected element, with centrality needed later for localization; `carryExponent` is defined for all natural moduli/inputs, with a positive modulus required for the cocycle theorem; `gammaStar` is rational at every integer and the residue theorem uses a punctured complex neighborhood. All denominators in these definitions are accounted for: Lean natural division at zero is total but no q=0 group presentation/cocycle theorem is claimed; factorials are nonzero, and rational-function and regulator divisions have explicit nonvanishing hypotheses.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/NoncommutativeAndEquivariantIwasawa.json`: zero errors and zero warnings. The unchanged accepted packet has 136 nodes, 19 gap records and 28 requests.
- `python3 scripts/check_sorry_data.py research/blueprint/packages/NoncommutativeAndEquivariantIwasawa/Suggested.lean`: exit 0, no admitted data definitions.
- `lean-check research/blueprint/packages/NoncommutativeAndEquivariantIwasawa/Suggested.lean`: exit 0; only five `declaration uses sorry` warnings, at lines 45, 70, 87, 112, 118. The six examples are proved. The final run finished before submission, with no Lean process left running.
- Shared build pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Memory was checked before compilation; more than 20 GB was available. No language server, cache download, lake update or lake build was started.
- Numbered-section/definition coverage and local-reference scan: 133 retained sections; all 50 retained definition/construction nodes have at least three Checks; no private target ids or removal stubs remain. Supplier section references are intentionally external. The final diff audit restored theorem-level Checks and all nine original worked-example cases, with corrected supplier ownership, signs and coefficient hypotheses; the old correction labels and process comments were omitted. Every retained subsection now has its own Checks list.
- `git diff --check`: passed.
- `python3 research/blueprint/intake.py check-files` on the four allowed deliverables: 4 files, 0 problems.

The independent package review is the next step. It should concentrate on the full analytic Möbius/source-quantifier boundary, completed-to-canonical descent, arithmetic duality shifts, the shifted Tate/Selmer leading terms and the named additional arithmetic inputs. No second job was taken. No source document or scratch file is needed to recover the delivered work: locators, URLs, digests, moves, limits and validation are all retained here.
