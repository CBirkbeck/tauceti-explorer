# Independent review: REV-FIX-RT-AREA-automorphic-1~3

**Completed independent fix review, 7 October 2026. Overall disposition: needs changes.** Refs #6902. Reviewer: ChatGPT GPT-6 Astra Pro, session `gpt6astra-e19d65722997`. The corrected IHG producer remains accepted. The other twelve packet reviews retain or receive `needs_changes` for the concrete unresolved statements and reader contradictions below. These are completed review verdicts, not a checkpoint.

## Input, independence and scope

The winning claim was confirmed by issue comment 6043004353, following claim comment 6043001220. This session wrote none of Codex `codex-2k3LL6`'s reviewed fix, PR #7260, merged as `ad42acee8dbe6ebde62e6cb6c0a307c3636458ea` (parent `76a7139635c7e35a69ba3bcf4a1b39858d5f844d`). The original 26 packet/suggested inputs were fetched and checked against their Git blob hashes at `8ccfd68a38a91121df6cbfd0fc26e3d2d6a0ccb8`.

This review follows `REV-FIX-RT-AREA-automorphic-1~2`, reads the original findings, independent verification and round-3 fixes, and adjudicates findings **/1–/31**. Findings /32–/41 are outside this fix job. Existing broad blueprint reviews are evidence with their own scope, not claims that this session freshly repeated every node or baseline audit. Their complete former review objects, including checked-node ledgers, are archived verbatim in `reviewHistory`; the two earlier QSeries history entries and the later topology review are preserved.

While this review was running, `REV-ArithmeticLocallySymmetricSpaces~2` landed on main. Its packet blob `c8f02f7116333451df5390b480d8403192b6faeb`, suggested blob `a93e72cb4543f105bac31a91d522297c59559a5b`, accepted review and synchronized reader were fetched at `0b0e3e6ba45315bcdb1be33006bed251d61c9023`. Its unrelated changes, full ledger and baseline descriptions are preserved; only the independently checked Nomizu/Kostant refinements are ported onto that version. The obsolete first-review counterexamples are not reinstated. The current reader nevertheless has the narrower new coefficient/Levi-realization contradiction documented below.

Only the issue's packet and suggested deliverables, this report and the job handoff are submitted. Reader, atlas, upstream, other-owner and checker files are read-only. No link map or standalone restructuring proposal is assigned. Proposed splits inside packets remain proposals. No compiler, language server, new Lake project, build or cache download was run: **all edited Lean files are uncompiled**. The prototypes remain planning material, with unchecked implementation status.

## What the verdict certifies

Each numbered result below distinguishes a corrected source/ownership contract from a still-unimplemented supplier move. In particular /3,/15,/16,/17 and the completed-consumer half of /18 are checked handoffs, not claims that CC/NE/TC/R31 files were changed. Honest source-proof leaves and unavailable-carrier omissions under PROTOCOL §13 are not by themselves rejection grounds. An expressible false hypothesis, a test of an unrelated object or a contradictory reader remains a blocker. Since accepted packets promote with their readers, a correct narrow packet edit cannot certify a reader that still states a materially broader false theorem.

The reviewed library-coverage entries were consulted before adding targets. Existing Mathlib/Tau Ceti primitives are imported rather than replanned. AUDIT-33's accepted IHG review was read directly because its rows remain absent from the aggregate index. The tables below state exactly which source passages and pinned declarations were freshly read; inherited broader reading and successful historical compilation are not attributed to this session.

## Per-packet disposition

| Packet | Verdict | Reason and earlier review followed |
|---|---|---|
| `GL2AutomorphicRepresentationsAndTransfer--R17.3` | **needs_changes** | Untouched arbitrary-type cyclic/solvable/induction maps and unconstrained Galois fixed-point claims are false. Follows `REV-GL2AutomorphicRepresentationsAndTransfer--R17.3` and the preceding fix review. |
| `AutomorphicFormsOnReductiveGroups` | **needs_changes** | Corrected narrow contracts; reader lines393/2685 still state false countability/base-change claims. Follows `REV-AutomorphicFormsOnReductiveGroups` and the preceding fix review. |
| `AutomorphicLFunctionsAndLocalFactors` | **needs_changes** | Reader still permits every entire multiple and claims z/L measure cancellation; Fourier/period synchronization remains. Follows `REV-AutomorphicLFunctionsAndLocalFactors` and the preceding fix review. |
| `GL2AutomorphicRepresentationsAndTransfer--R16.1` | **needs_changes** | Untouched Kirillov, local-multiplicity and trace signatures fail on explicit elementary examples. Follows `REV-GL2AutomorphicRepresentationsAndTransfer--R16.1` and the preceding fix review. |
| `AutomorphicSpectralTheory` | **needs_changes** | B1/B2 continuation counterexamples, B3 probability/character hypotheses and remaining B4 object-test mismatches survive. Follows `REV-AutomorphicSpectralTheory` and the preceding fix review. |
| `ArithmeticLocallySymmetricSpaces` | **needs_changes** | Preserve newer accepted revision; its reader still gives a Levi action to an arbitrary N-module without a P-extension. Follows `REV-ArithmeticLocallySymmetricSpaces~2` and the preceding fix review. |
| `AdelicAlgebraicGroups` | **needs_changes** | Arbitrary quotient topology does not give a covering map; prior reduction/supplier contradictions and reader work remain. Follows `REV-AdelicAlgebraicGroups` and the preceding fix review. |
| `HilbertModularVarietiesAndShimuraCurves--R18.2` | **needs_changes** | Corrected packet/Lean slice; reader line528 still claims the residual KW theorem over arbitrary coefficient algebras. Follows `REV-HilbertModularVarietiesAndShimuraCurves--R18.2` and the preceding fix review. |
| `IntegralHeckeAndGaloisDeterminants` | **accepted** | Finite complete-local producer verified; completed consumer construction remains a qualified external handoff. Follows `REV-IntegralHeckeAndGaloisDeterminants~2` and the preceding fix review. |
| `GrossZagierAndArithmeticHeights--GZ.0` | **needs_changes** | Reader overstates the split Shimizu proof; the new author draft does not certify inherited published-book metadata. Follows `REV-GrossZagierAndArithmeticHeights--GZ.0` and the preceding fix review. |
| `MetaplecticAutomorphicForms--MP.0` | **needs_changes** | Untouched generic theta/finite-length/growth contradictions and the reader’s stale downstream GZ prerequisite remain. Follows `REV-MetaplecticAutomorphicForms--MP.0` and the preceding fix review. |
| `MetaplecticAutomorphicForms--MP.8` | **needs_changes** | Reader retains false gamma/chart/modulus/original-function and L2 supplier assertions. Follows `REV-MetaplecticAutomorphicForms--MP.8` and the preceding fix review. |
| `QSeriesPartitionsAndMockModularForms` | **needs_changes** | Reader omits balanced/finite-image hypotheses and has obsolete graph text; prior topology/export obligations remain. Follows `REV-FIX-RT-AREA-topology~4` and the preceding fix review. |

## All assigned findings

All identifiers in this table have prefix `RT-AREA-automorphic-1/`. Detailed arguments, corrections and source locators follow in the four subject sections.

| Finding | Subject | Verdict on the scoped fix | Reason / remaining boundary |
|---|---|---|---|
| 1 | GL₃ converse and nonnormal cubic transfer | corrected | Full/reduced ranks and S/T twisting remain distinct; local pole regularity added. Original construction proofs remain explicit. |
| 2 | Archimedean classification | verified after scope corrections | Keep the real/complex Weil, Langlands and globalization hypotheses; no finite-place LLC is substituted. |
| 3 | Lazard and Iwasawa finiteness | limited handoff verified | CC/NE are outside this issue. General analytic-group and noetherian/dimension inputs remain assigned to their foundational owner. |
| 4 | Independent local harmonic analysis | corrected | Real induction is local, not a global cuspidal occurrence. PW, μ and multiplier adapters retain their exact missing interfaces. |
| 5 | Initial and pseudo-Eisenstein theory | corrected | Separate fixed-centre and full-height constructions; correct contour/sign/domain and record Arthur E37. |
| 6 | Lattice Nomizu and Kostant | corrected | Finite algebraic coefficients, Levi extension, rational realization, splitting field, dominant weight and HR source range restored. |
| 7 | Kneser–Tits input | corrected | Rapinchuk’s Q/single-isotropic-prime argument is not the full number-field proof; remove the invalid simply-connectedness stand-in. |
| 8 | Global Fourier and mirabolic inputs | corrected | Fourier reconstruction precedes genericity/factorization; preserve the theta–Mellin normalization and pole hypotheses. |
| 9 | Ordinary multiplicity one | corrected | Add one AL-owned theorem and import it into R16 before strong multiplicity one. |
| 10 | Analytic supplier edges | corrected | AF supplies cusp/decay/Flath; AL proves GLn Fourier, genericity and ordinary multiplicity one. |
| 11 | R16 to R17 imports | verified and unsafe signatures corrected | Preserve strong-MO and weight-one interfaces with actual primitive, infinite-type and coefficient hypotheses. |
| 12 | Global Jacquet–Langlands to R18 | verified and scoped signatures corrected | Exclude norm characters; characteristic-zero comparison does not imply integral lattice equality. |
| 13 | Periods and p-adic ownership | corrected | GL₂/ℚ normalization is separate from general-field algebraicity and higher-rank period construction; stage changes remain proposals. |
| 14 | Schwartz–Bruhat ownership | verified | AL.0 owns test functions/Fourier; AA supplies points and Haar/quotient measures. |
| 15 | Perfectoid comparison | limited handoff verified | Fixed-exponent compact-support object in CC; geometric automorphic-section theorem belongs to TC with its actual hypotheses. |
| 16 | Generic adapters and Shimura instances | limited handoff verified | CC transports supplied comparisons; R31/TC construct the actual instances. No move is claimed implemented here. |
| 17 | General Banach category | limited handoff verified | Use the compact analytic-group Schneider–Teitelbaum theorem first; compact-open independence is additional. |
| 18 | Finite and completed Hecke algebras | producer verified; consumer handoff retained | IHG.2’s complete-local finite algebra theorem is correct; profinite stabilization/patching is not an arbitrary inverse-limit theorem. |
| 19 | Siegel–Weil and Shimizu | corrected | Binary/ternary range and source locators corrected; a regularized quotient identity does not prove the split pairing. |
| 20 | Jacobi and fine special functions | corrected | MP.6 is the producer; L2s is the actual unitary consumer; balanced tensor and finite-image conditions restored. I/J/MW carrier closures stay independent of QM.1. |
| 21 | Smooth representations before theta | ownership fix verified | SR supplies smoothness, normalized functors and finite-length interfaces; algebraic coinvariants alone do not prove Howe duality. |
| 22 | Local invariants and global coherence | corrected | QFI6C owns local Hilbert/Hasse invariants; GlobalQuadraticForms Layers3/7/8 owns global quadratic realization/classification. |
| 23 | Theta growth suppliers | ownership fix verified | Early AA/AF reduction/growth inputs are correct; compact majorants do not imply every differentiated uniform bound or split integral. |
| 24 | Ordinary and weighted orbital integrals | corrected | ET supplies the ordinary quotient integral; AS adds the weight. Rank-one order and actual Haar-scaling tests are restored. |
| 25 | Cohomological representation theorems | verified with source-proof limits | Retain infinitesimal-character, central/component and degree-range hypotheses; distinguish the original VZ paper from a full modern classification proof. |
| 26 | Spherical commutativity | ownership fix verified | Use SR.4 with the actual hyperspecial/coefficient regime before Flath’s spherical lines. |
| 27 | Boundary induction and Satake | ownership fix verified | Keep SR.2/SR.4 and RG2.4; normalized square roots and integral unnormalized coefficients are distinct. |
| 28 | Neatness | corrected | Representation independence/existence uses actual algebraic representations, not arbitrary rational-point group homomorphisms. |
| 29 | One Lie-cochain owner | corrected | AF.1a owns generic cochains; local finiteness is not countability, and the GSp₄ pair requires central balancing. |
| 30 | Betti and rationality inputs | ownership fix verified | Early ALS geometry/Hecke comparisons precede arithmetic AF.4 applications; analytic classification is kept independent. |
| 31 | Algebraic automorphic forms | corrected | AF.5 is generic owner; coefficient/central/stabilizer extensions remain explicit, and KW degeneracy is residual before separate integral control. |

## Detailed review: Spectral theory, completed-cohomology handoffs and the IHG producer

### Finding decisions in this part

#### /3 — Lazard and Iwasawa dimension theory

Verdict: correct, limited handoff; not implemented in this issue. Schneider–Teitelbaum v1 §3 pp.12–15 explicitly uses left/right noetherianity of o[[G]] for compact p-adic Lie G. Proposition3.1's canonical topology, Lemma3.4's dual finite-generation criterion and Theorem3.5's anti-equivalence do not supply the original Lazard proof. The verified restriction to the integers of a finite p-adic field and the distinction between noetherianity and Auslander regularity remain essential. The no-p-torsion/uniform subgroup/descent conditions cannot be dropped. The Calegari–Dimitrov–Tang powerful-group cohomology lead is not a general noetherianity proof.

Neither CC nor NE is editable here. BP-CompletedCohomologyPartII--CC.0 must request the foundational NE.0/L1 successor and import its exact compact-analytic-group theorem into CC.5. No new owner or edge is asserted to exist merely because this handoff is correct. The reviewed AUDIT-14 CC.5 entry agrees that the required uniform/analytic group theory and general admissible Banach category are absent.

#### /4 — Independent local harmonic analysis

Verdict: corrected in place; the local-prefix integration remains pending. The round-3 proposal correctly put real invariant/operator Paley–Wiener and spectral multipliers before ET.1. Its claimed supplier AS.1/induced-family was wrong: that node requires a global automorphic occurrence of inducing data in L²([M]¹). The local real theorem needs no such occurrence. Both real PW nodes now use AF.1/sf-representation plus a precise request for normalized induction from arbitrary supplied real Levi SF or unitary Hilbert data, fixed compact pictures, holomorphic parameters, finite K-types and induction in stages. AF.1's minimal-parabolic, finite-dimensional principal series is not sufficient. The supplier packet records the matching gap. AS's proposal and suggested-file boundary note use this local contract.

Clozel–Delorme II, Theorem1 pp.194–195, retains all four conditions, including finite inducing support and the relations among induced limits of discrete series. Arthur 1983 Acta III§4 Theorems4.1–4.2, pp.84–87, requires the full differentiated operator relations. The multiplier's scalar infinitesimal character belongs to an irreducible admissible representation; the API now says so. Arthur 1989 Theorem2.1, pp.28–29, retains local normalization, cocycle, adjoint, Weyl, induction, rationality, tempered and spherical qualifications; its proof reduces to rank one, and its real proof uses Harish–Chandra's actual Plancherel density.

The suggested real-PW conclusions for an arbitrary linear map or pair of rings were false, and arbitrary J=0 cannot satisfy a unitary inverse after normalization. Those full signatures are explicitly omitted until the named carriers exist. A sound multiplier adapter transports a symbol that preserves a specified Fourier-image submodule through a supplied linear isomorphism. A scalar-composition adapter defines μ as the inverse of the actual opposite-composition scalar, with rescaling, identity and spherical tests that call that definition. The root-product equation requires an actual factorization hypothesis. Local intertwining now requires integrability and pointwise compatibility; arbitrary-kernel meromorphic continuation is omitted. Its spherical test computes the normalized valuation-shell integral through local_intertwiner; identifying those shells with the actual GL₂ unipotent quotient remains explicit. No arbitrary unrelated operator is used as the spherical integral.

This repairs the scoped defects; it does not integrate AS.1a or certify the current coarse stage graph acyclic. The nonarchimedean Bernstein–Deligne–Kazhdan request remains with SmoothRepresentationsCharactersPartII. Final orbital integrals and Euler–Poincaré theory still follow ET.1.

#### /5 — Initial Eisenstein series and pseudo-Eisenstein spaces

Verdict: corrected in place. Arthur's full-height construction uses a_P and L²(G(F)\G(A)), whereas the packet applied that transform to G(F)\G(A)¹ without restricting the split centre. For G=G_m a nonconstant compactly supported function of log|g| does not descend through the split centre. The principal packet construction now fixes the trivial split-central character, uses a_P^G and the compatible inducing restriction, and puts its L² and inner-product statements on the matching quotient. The full-height construction is retained as a separate variant. The torus test states the difference: full-height Fourier inversion survives, while a_P^G=0 in the fixed-central variant.

Arthur05 Lemmas12.2–12.4 pp.64–66 and Langlands66 §4, formula(2), pp.4–5 support the construction and reflected conjugate parameter. The suggested one-dimensional torus specialization now has the negative forward Laplace sign and dt/(2π) when the imaginary contour is parametrized by t. Both its inversion test and the exclusion of exp(z⁴) use the actual constructor/domain. The packet's vector exclusion now requires a nonzero vector, since exp(z⁴)·0 is the zero Paley–Wiener section. The linearity adapter preserves compact-support smoothness and integrability.

The former universal convergence, constant-term, pseudo-Eisenstein L² and inner-product signatures for arbitrary inducing data/operators/functions were removed. Exact chamber, quotient, Weyl, central and smoothness inputs remain named signature omissions; these are not assertions that the omitted theorems follow for arbitrary data. The continuation/wave-packet pipeline is not duplicated, and its remaining proofs stay with BP-AutomorphicSpectralTheory~2.

New sourceIssue AutomorphicSpectralTheory/E37 records an actual sign misprint in Arthur05 equation(7.2), p.34. The outer exponent is printed with +ρ_P′, but must be −(sλ+ρ_P′)H_P′(x). With s=1 and P′=P the printed expression leaves exp(2ρ_PH_P(x)), contradicting the identity point-quotient integral. The correct local convention also appears on p.135. The p.34 page image and the identity substitution were checked. The packet already used the correct exponent; its source locator now explicitly records this departure from the display. Bounded searches in the author/Clay archives found no separately labelled correction; no novelty claim is made.

#### /15 — Fixed exponents and the perfectoid comparison

Verdict: correct, limited handoff; not implemented here. Scholze arXiv1306.2070v2 TheoremIV.2.1 and its proof, pp.69–70, were read. The compact-support object uses colim over K_p at fixed exponent n. The comparison is of almost-O_C modules on the perfectoid minimal compactification, with the ideal of its strongly Zariski closed boundary. Its proof uses singular/algebraic/adic comparisons, torsion comparison, limit comparison and almost purity for trace. The Hodge-type embedding, tame level N≥3 prime to p, and pullback/trace diagrams remain specified. This proof does not itself use the Hodge–Tate map; that map occurs in the preceding geometric construction.

The automorphic-section theorem and dependent corollaries belong to the TC.2 suffix, with CC.8 supplying only its generic fixed-exponent object/adapter. BP-CompletedCohomologyPartII--CC.8 and BP-TorsionCohomologyInfrastructure must perform the move and supply its geometric inputs. No CC/TC file is in the allowlist, and none is edited. The comparison is not certified to have moved.

#### /16 — Generic adapters and actual Shimura instances

Verdict: correct, limited handoff; not implemented here. Retain verified repair(b): CC.8 is a parameterized transport/localization adapter for a supplied finite-level comparison; R31.1 and TC.2 construct their actual GL₂/quaternionic and Hodge-type instances. R31.1's specialization is not a second generic completed-cohomology definition. Nor does this review assert that no general Betti–étale owner exists: the previously extracted ShimuraVarietiesPartIIAutomorphicCohomology route must be checked at its integrated stage/node before reuse. BP-CompletedCohomologyAndLocalGlobalCompatibility and BP-CompletedCohomologyPartII--CC.8 retain this work. The reviewed CC.8 audit records that the concrete tower/comparison instances are absent from the pins.

#### /17 — General Banach representation category

Verdict: correct, limited handoff; not implemented here. Schneider–Teitelbaum Theorem3.5 is the compact p-adic Lie group result. It uses K[[G]]=K⊗_o o[[G]], not an unrestricted inverse limit of K-valued finite group rings. Lemma3.4 proves the admissibility/dual finite-generation criterion using the canonical compact-module topology and Nakayama; Theorem3.5 then gives anti-equivalence and abelianness. A locally compact p-adic group requires a separate compact-open independence theorem. BP-CompletedCohomologyPartII--CC.0 and BP-PadicLocalLanglandsForGL2Qp must share this general owner beside the completed-algebra theory and only then specialize to GL₂(Q_p).

#### /18 — Finite Hecke factors and the completed limit

Verdict: IHG.2 producer verified; completed consumer work remains routed. Fresh ACC23 §1.2 p.905 agrees with the finite-commutative-algebra contract over a complete noetherian local base. The packet's derived-image finiteness first uses bounded finite cohomology and the noetherian finite-Ext argument, then finite submodule generation. The finite local factor theorem and localized-complex construction use the same image, its central idempotents and idempotent splitting in the derived category. The prototype keeps the complete-local, noetherian and module-finite hypotheses. Its omitted localization/topology identification is explicitly described and is a permissible supplier omission.

Gee–Newton v5 Definition2.1.11 and Lemma2.1.14 pp.10–11 distinguish the finite derived image algebras from their profinite inverse limit. The semilocality proof stabilizes maximal ideals using a pro-p finite quotient, the homology spectral sequence and nilpotent kernels; it is not a theorem for an arbitrary inverse system of finite algebras. Ordinary algebraic localization does not require semilocality. The needed result is the compatible completed topological decomposition in this tower.

Proposition3.4.16 pp.23–24 is expressly the patched O_infinity[[K_0]] complex; its proof uses the ultrafilter/patching construction, uniform pro-p subgroups and compatible minimal resolutions. Proposition3.4.19 compares its reduction with completed homology. These are source leads under their actual hypotheses, not an unconditional proof for every CC.4 tower. The CC.8/R31 jobs must import IHG.2 and construct the limit and localization. TC.2's two supplier edges alone do not prove a duplicate construction.

IHG retains accepted status following REV-IntegralHeckeAndGaloisDeterminants~2. That earlier full review is preserved; this pass rechecks only /18 and its nearby producer contracts, not all 253 nodes. The reviewed AUDIT-33 result and REV-AUDIT-33 report were read directly because AUDIT-33 is still listed pending in the aggregate library-coverage index and its IHG rows are absent there. No fresh all-67-baseline or compilation claim is made.

#### /20 — AS side of the fine special-function imports

Verdict: fine I/J/M/W carrier imports verified, with one proof correction. The only remaining broad QM.2 prerequisites in AS are AS.0/dit-113 and AS.0/gz-217, exactly the still-requested K-function cases. Other consumers use the fine I/J nodes, QM.3 Kloosterman/raw-Laplacian nodes or AS.0/dit-112. The latter's carrier closes on the existing hypergeometric/Gamma baseline without going through QM.1. AS.0/dit-113 and dit-114 now directly cite that actual M/W definition.

DIT11 AppendixA p.977 gives the M/W Euler formulas, ODE and fixed-parameter asymptotics. It does not prove uniform differentiated bounds over parameter compacts. AS.0/dit-114's proof step now names that separate domination/exceptional-parameter continuation obligation. This change is coordinated with the MP/QM fine requests. Remaining K-function, theta-nonvanishing and coarse-stage cycles are not declared solved.

#### /24 — Ordinary and weighted orbital integrals

Verdict: corrected in place, retaining the authorized structural handoff. ET.1 supplies the ordinary quotient-centralizer integral; AS adds the convex-hull weight and its estimates/splitting. Connected centralizer equality is retained for the displayed direct integral; singular/induced-class central-shift limits remain separate. Arthur05 §§17–18 pp.135–148 distinguishes local J normalization and the weighted-orbital definition.

The rank-one test now requires positive orthogonal ordering r≥0. An unoriented interval length is |r| times the coroot covolume; the old formula for arbitrary r was false. The suggested test evaluates the actual two-height weight with θ_+=z/vol and θ_−=−z/vol. The Haar-scaling test uses the actual weighted orbital integral with inverse quotient measure under a nonzero nonnegative scalar; it no longer tests only scalar cancellation. Two-place splitting for arbitrary unrelated scalars was removed and left as an exact omission pending actual Levi/quotient/constant-term inputs.

### AS whole-packet status and scope limits

Keep needs_changes. REV-AutomorphicSpectralTheory's B1 and B2 are still visible, unchanged, in schwartz_family_continuation and lf_dual_continuation. The former admits exp((1−s)x²) from Re(s)>1 and falsely requires a Schwartz value at s=1. The latter permits discontinuous Hamel functionals vanishing on a dense subspace and falsely concludes continuity everywhere. B3's yu_149 still lacks probability Haar and the full smooth-character hypotheses: μ=0 and f=1 contradict its normalized fibre-average conclusion. These are expressible missing hypotheses, not future-carrier omissions.

The prior B4 list is reduced in the scoped pseudo-Eisenstein, local/μ, weighted and multiplier examples, but remains substantial. Examples inspected directly include operator_meromorphic.pointwise_orders (unbounded naturals without the operator family), yu_148.test2/test3 (scalar arithmetic without the transfer constructor), and unrelated finite-character/Franke/kernel tests. Inherited continuation and kernel signatures for arbitrary numerical data remain unverified. Neither a source gap nor a successful schema check cures these failures. The earlier all-node ledger is archived as historical evidence and is not represented as a fresh 190-node review.

### Source versions actually used here

All dates are 2026-10-07. Public source files were freshly obtained and their text extracted; Arthur05 pp.34/65 were additionally inspected as rendered page images.

| Source | Public URL | SHA-256 | Actual reading relevant to this review |
|---|---|---|---|
| Arthur, Introduction to the Trace Formula | https://www.claymath.org/library/cw/arthur/pdf/62.pdf | 2b6623010ce5d854732458dfb5e61600a4e6cc7288629a72cb63d5f7530ac510 | pp.34,64–66,102–103,135–136,146–148; central convention, initial construction and weighted integral |
| Arthur, Acta1983 | https://www.claymath.org/library/cw/arthur/pdf/15.pdf | a78240ce1095e2a17591bf829fa726675ca865e77e8c3d663823d3dcf4fb8034 | III§4 pp.84–87, theorem statements, relations and multiplier proof |
| Arthur, Intertwining Operators and Residues1989 | https://www.claymath.org/library/cw/arthur/pdf/28.pdf | 0ba6be4e9e8020d1d0cf6a3a87cb79297e66f18a75d2af7d1e09d3e57139c13f | pp.27–29,34–36; rank-one reduction and real normalization inputs |
| Clozel–Delorme II1990 | https://www.numdam.org/article/ASENS_1990_4_23_2_193_0.pdf | dd70f4069fdeec6fc31e44557f239080f5c169743dc8aa2de5b69659da594432 | pp.193–195,208–211; exact four conditions and the restriction/tempered interfaces |
| Langlands, Eisenstein Series1966 | https://publications.ias.edu/sites/default/files/Eisenstein-series-rpl_0.pdf | 7ee86983d6d186532cd229ec3223d999a6e643f960bac62e970a1257b2f66715 | pp.4–8; Fourier measure, reflected pairing and continuation setup |
| Duke–İmamoğlu–Tóth2011 | https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n2-p08-p.pdf | 8f2b8ed3518fe69f08a72ef0ed3311d30523042335d4bd0e1ffd82d84459a010 | AppendixA p.977, with preceding context |
| Gee–Newton v5 | https://arxiv.org/pdf/1609.06965v5 | 068818a4b0e12f97184d72cd7704663f5269f9297f017ff99172325ed5f67601 | pp.10–11,23–29; finite images, semilocality and patched-perfect distinction |
| Schneider–Teitelbaum v1 | https://arxiv.org/pdf/math/0005066v1 | 28dfe78dc1fcbe908641523a17ee1fdec5f330494dfdd5e4a48ac7b181c78747 | §3 pp.12–15, canonical topology, dual criterion and anti-equivalence |
| ACC23 author-hosted journal file | https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf | c5429e4f384384045dbb48502d71547bb21699783c0f77cce27b24e742467f02 | §1.2 printed p.905; finite Hecke factors and derived idempotents |
| Scholze v2 | https://arxiv.org/pdf/1306.2070v2 | e15abf4e7ab3e400ecaae963e5ccd80b340919d8499ebfde5b55f2ceb83ab285 | pp.68–70; geometric context and complete proof of IV.2.1 |

Arthur's separate 1983 Paley–Wiener survey was downloaded (hash a1eb8329d69373748f2f7ac13f0e2c4241e1cbece8b9f39fc18780a64e9faac1) as a lead; no separate full-paper reading is claimed. Original Lazard/Venjakob proofs, a full collation of every inherited source issue, and out-of-scope source proofs are not claimed read.

### Baseline and reader details

Fresh declaration statements and enclosing hypotheses were read for all 24 AS baseline references: L²/Fubini/sum-interchange and dominated differentiation, barrelled uniform boundedness, hypergeometric and Gamma definitions, compact Peter–Weyl, Stone, probability-Haar homomorphisms, torus Fourier and finite character orthogonality, hyperbolic distance, Vitali, normed vector-valued Schwartz/postcomposition, finite-dimensional eigenbases, compact nonzero eigenspaces, Fredholm perturbations and the compact symmetric Hilbert basis. The six IHG-side references read are ModuleCat.finite_ext, DerivedCategory, DerivedCategory.Q, DerivedCategory.Qh, Module.Projective and IsAdicComplete. All 23 containing files match their Git blob hashes at Mathlib082e2d37e8b0463410cdb532e111cd43d5a66174 or TauCetif790474821cf4256814db967cb154e7af3d0c369. No broader baseline sweep is implied.

The AS reader is outside the issue allowlist. It still needs the local rather than global real-induction prefix; fixed-central/full-height pseudo-Eisenstein conventions and matching L² contour; corrected Arthur(7.2) attribution; nonzero-vector entire-growth test; irreducible multiplier qualifier; fixed-parameter rather than uniform differentiated DIT claim; positive rank-one ordering; and the refined signature/adaptor scope. These are recorded follow-up edits, not silently performed. IHG's /18 producer prose already agrees and requires no reader change from this section.

The selective browser/API workspace contains read-only supplier packets at the same base. Whole EllipticRegulators supplies ER.7/real-analytic-eisenstein-series; the split ER.7 packet alone does not. All unresolved lookup errors were resolved by obtaining actual suppliers, without deleting valid dependencies. No atlas, upstream, reader, unrelated packet or checker change is submitted. The checker has no local declaration index, so baseline names receive form-only mechanical checks plus the stated independent source reads. No Lean compiler, cache, build or language server was run.

## Detailed review: GL₂ transfer, GL(n) L-functions and the definite-quaternion consumer

### Finding ledger

#### RT-AREA-automorphic-1/1 — corrected

Verified full/reduced generic converse contracts and S/T distinction; added named API acceptance tests and the missing omitted-local-factor regularity in the GL3 cuspidal pole comparison. Replaced false assigned transfer prototypes by precise omissions.

Remaining: AL G16 original full/reduced proof interiors, GJ highly-ramified variant and twisted symmetric-square proof, original nonnormal cubic JPSS construction and Carayol all-place upgrade remain explicit. This review does not mark those proofs verified.

#### RT-AREA-automorphic-1/8 — corrected

Verified Fourier and mirabolic source normalizations, last-upper-column reconstruction, norm-twist pole hypotheses. Removed factorization prerequisite from Fourier and added Fourier as prerequisite of factorization/unfolding.

Remaining: General local Rankin–Selberg and archimedean proof refinement remains in existing AL G6/G7; function-field adaptation uses the same compact Fourier argument with its AA/AF suppliers.

#### RT-AREA-automorphic-1/9 — corrected

New AL.3/global-multiplicity-one proves ordinary embedding multiplicity from Fourier injection and continuous Whittaker uniqueness before strong multiplicity one; R16.4 imports it.

Remaining: Actual smooth Hom/cusp embedding carriers unavailable at pins; source-specific Lean omission is permitted, not an implementation.

#### RT-AREA-automorphic-1/10 — corrected

Removed nonexistent AF.3 genericity/ordinary-MO supplier. AF supplies cusp forms, compact unipotent quotients, decay and Flath; AL proves GLn Fourier/genericity/factorization/MO. Updated G15 and requests.

Remaining: General AF finite multiplicities remain AS inputs; no circular genericity assumption may reappear in reader or stages.

#### RT-AREA-automorphic-1/11 — corrected

Retained R16.4 strong-MO handoff to R17.3 and full characteristic-zero/classical weight-one comparison to R17.5. Removed arbitrary-type source-theorem signatures in assigned comparisons.

Remaining: Native primitive subtype, full O(2) limit-type/oddness/lowering operator and geometric comparison still needed. Tunnell proof not freshly accessible; inherited off-scope invalid local/cyclic prototypes are concrete whole-packet blockers.

#### RT-AREA-automorphic-1/12 — corrected

JL source domain excludes norm characters; compatible finite/infinite types and rational-model transport remain explicit. Verified Taylor and CDN characteristic-zero finite-level/cohomological comparisons; omitted arbitrary globalJL type equivalences.

Remaining: Integral/torsion comparison and R18 indefinite Ihara are separate requests. Mere field-of-rationality equality does not produce a rational model.

#### RT-AREA-automorphic-1/13 — corrected

Restricted ModularSymbols L1 critical-value interface to GL2/Q; general GL2/F goes to AutomorphicPadicLFunctions L1 in its source range. AL owns higher-rank Whittaker/cohomological period proof and imports exact AF4+ALS5 comparisons. Proposed late rational-period suffix avoids back-edge to analytic prefix.

Remaining: Raghuram–Shahidi comparison/twist proof and rational refinement remain G12; no general Rankin algebraicity/p-adic Rankin family certified. Stage split is a proposal, not an installed acyclic atlas.

#### RT-AREA-automorphic-1/14 — verified

Checked AL0 Fourier/test-function and AA0 restricted Haar, AA1 adelic points, AA2 quotient ownership for assigned GL2/AL consumers. Removed false generic topology comparison signatures; retained exact supplier requests.

Remaining: RS21 is outside this issue; the AA/AS packet changes are documented in the adjoining subject sections. Algebraic points/restricted product alone do not supply quotient integrals.

#### RT-AREA-automorphic-1/31 — corrected

Retained AF5 owner and explicit central-character/effective-stabilizer extension; corrected all R18.3 psi domains and residual-only KW degeneracy. TW integral control separately uses characteristic-zero rank comparison and residual injectivity.

Remaining: AF5 LevelAlgebraicModularForm still lacks requested central quotient; finite class-set alone never proves integral freeness. Reader still states broader arbitrary-A degeneracy.

### Corrections and exact interfaces

The new target is `AutomorphicLFunctionsAndLocalFactors:AL.3/global-multiplicity-one`, declaration `TauCeti.AutomorphicLFunctions.AL3.GlobalMultiplicityOne`. It concerns the smooth intertwining embedding space of an irreducible representation in the cuspidal spectrum: dimension at most one, equality for a cuspidal occurrence. Its API compares actual embeddings and images, not an arbitrary multiplicity function. Named tests distinguish rescaling an embedding, finite-level dimension from automorphic multiplicity, and absence of a cusp occurrence. It uses local continuous Whittaker uniqueness and the global Fourier injection; strong multiplicity one subsequently identifies representations. R16 specializes this output.

The AL Fourier expansion now precedes factorization and proves global genericity. Its proof expands the last upper-unipotent column, kills constant terms by cuspidality, and uses rational orbit/stabilizer calculations; AF3 is not assumed to export genericity. Archimedean Whittaker uniqueness is for continuous functionals on the appropriate globalization: arbitrary Harish-Chandra-module functionals have a different multiplicity. Flath identifies the restricted tensor product before local uniqueness gives factorization of pure vectors. This is the same ordering visible in Yu’s function-field consumer, with its spherical normalization kept in its actual scope.

The new converse tests name n=2/all-character full twisting, n=3/ranks1&2 full twisting, an unchecked pole failure, n=3/empty-S reduced twisting, nonempty-S weak matching, exclusion of n=2 from the reduced theorem, and the distinction between highly ramified T and unramified-at-S families. Entireness of both dual functions, finite vertical-strip bounds, correct epsilon FE, idele-class central character and right-half-plane Euler convergence remain explicit. The CPS-I original theorem’s unramified-outside-S variant is not silently substituted. Original source proof gaps remain G16.

R17’s partial Rankin–Selberg pole comparison now explains why all omitted finite and archimedean factors are finite and nonzero at s=1, using the unitary Satake/local-convergence input; otherwise a statement about the full L-function does not imply the claimed partial pole criterion. It uses cuspidal rank-three comparison, not an invented GL3 isobaric-uniqueness theorem. Adjoint Satake tests now evaluate the genuine diagonal formula (alpha/beta,1,beta/alpha); the input(2,3) is visibly different from Sym²(2,3)=(4,6,9). These matrices do not construct an automorphic adjoint lift.

AL’s higher-rank period comparison explicitly owns the Whittaker rational structure and comparison/twist proof. It imports AF4/clozel-rationality, AF4/cohomological-representation and ALS5/de-rham-comparison, automorphic-comparison, cuspidal-cohomology, with a rational-refinement request. ALS uses m_G=g_C/a_G, a cancelling A-infinity character, neat level and finite-dimensional algebraic coefficients. Neither ALS nor AF currently proves the AL Gauss-period twist theorem. The period hypothesis is regular algebraic strongly pure/cohomological data with a permissible one-dimensional bottom-degree infinity line; the coefficient field contains the relevant rationality fields. The GL2/Q ModularSymbols normalization interface stays a concrete scalar identity and supplies no general-F algebraicity. The late comparison suffix is a proposed stage restructuring, not a claim that the current stage graph is already acyclic.

Hilbert’s common central character now has domain A_F,f^×/F^× and codomain O^×. AF5’s updated LevelAlgebraicModularForm carries actual compact-level coefficients; central character/effective stabilizer compatibility remains an extension request. KW Lemma7.1 uses a finite-dimensional residual k-module with finite quotient action and trivial action at the auxiliary hyperspecial place. Integral control in Cor7.5 is obtained separately from characteristic-zero rank comparison and residual injectivity. A finite class set only gives a finite direct sum of stabilizer invariants; averaging or the specified KW stabilizer/diamond argument is needed for freeness and base change. The dyadic torsion quotient is Delta-prime/Delta-prime[N], not the quotient by Nth powers.

### Concrete remaining invalid signatures outside the assigned repair regions

These are counterexamples to the literal prototypes, not to the cited mathematical theorems. They remain unedited to avoid turning the nine-finding fix review into a rewrite of all local/trace/base-change targets.

* R16 suggested line232 `supercuspidalKirillov`: asserts a linear equivalence between any two complex modules. Take a one-dimensional module and the zero module.
* R16 line224 `iwahoriOldforms`: arbitrary modules do not have dimensions2 and1; take both zero.
* R16 line235 `henniartUnicity`: arbitrary multiplicity function can be identically0, contradicting value1.
* R16 line642 `spectralLedger`: setting cusp=1 and every other arbitrary complex scalar=0 gives 1=0.
* R16 line646 `strongCuspidalVanishing`: the arbitrary endomorphism can be the identity on the nonzero module C. R16 line651 `specializedTraceComparison` likewise asserts equality of arbitrary complex scalars.
* R17 line116 `cyclicBaseChange`: with FClass=Unit and EClass=Empty its claimed function cannot exist. The same issue occurs for `solvableBaseChange` and `quadraticInduction` with an inhabited source and empty target.
* R17 line137 `cyclicBaseChange_galois`: even imposing inhabitedness does not help; EClass=Bool and sigma=Boolean negation has no fixed point. The quantified sigma is not constrained to a genuine automorphic Galois action.

The old header sentence claiming that these signatures are not unconditional theorems for arbitrary types is therefore inaccurate. Correct repairs must use the actual supplier objects and hypotheses or explicit §13 omissions; arbitrary Prop fields or a comment beside a false theorem cannot supply those hypotheses.

### Reader comparison and round3 scope

Readers were freshly obtained at the review base and read-only. Round3 actually added the AL full/reduced converse contracts and tests/proof-gap discussion, gave the R16 explicit AL Fourier/strong-MO handoff, and changed R17 gl3-recognition to the cuspidal pole criterion rather than unsupported isobaric uniqueness. Its report did not establish original converse/cubic proofs. The previous ~2 review concerned the narrow QSeries finding20 and did not newly certify this transfer slice.

Confirmed current reader corrections already present: AL lines499–510 use completed archimedean tensor products and dense factorizable functions; the previous algebraic-span objection is obsolete. Current converse text at2179–2217 and G16 around2533 correctly separates full/reduced ranks and S/T variants. Preserve that progress.

Confirmed outstanding reader work, outside edit permission:

* AL line15 still says changing multiplicative Haar convention cancels from normalized local distributions. With a fixed L-factor, z/L scales with the measure; epsilon ratios are a separate assertion. The previous measure objection is not cured by the updated global-volume formula.
* AL line1657 still realizes every entire multiple hL, without Jacquet’s vertical-strip-bounded L(tau) restriction already in the corrected packet. This is the older substantive reader blocker; original Jacquet proof was not reread in this scoped task.
* AL lines1689–1713 retain genericity as an assumption, Fourier depending on factorization, AF3 instead of AF2 tensor supplier, and last-row expansion. Lines1829–1833 still use an AF global-MO theorem. Synchronize the new AL-owned chain and added ordinary-MO node.
* AL lines2167–2175 still import unnamed Whittaker/cohomological rational structures and twisting law; line2354 still describes GL2/F while directly citing only ModularSymbols L1. Synchronize regularity/signature/rational fields, exact ALS/AF suppliers, AL-owned gap and GL2/Q scope.
* R16 reader needs the new exact AL ordinary-MO import and the distinction between omitted source interfaces and remaining valid concrete fragments. Its broad prototype disclaimer is not proof that arbitrary signatures are sound.
* R17 lines708–720 correctly show the cuspidal comparison but omit the new finite-and-infinite local-factor regularity input. The line33 claim that all prototype conditions avoid unconditional arbitrary statements is contradicted above; the historical elaboration count is not validation of this edited file.
* Hilbert line528 still states arbitrary-A degeneracy; replace with the residual coefficient statement and distinguish Cor7.5 integral control. Common R18.3 hypothesis paragraphs also need psi’s quotient domain. The existing reader correctly distinguishes characteristic-zero JL from integral lattice equality.

### Pins, supplier coverage and limitations

Binding Mathlib pin082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti pinf790474821cf4256814db967cb154e7af3d0c369 were preserved. No new baseline declaration reference was introduced. This part of the review did not reread all original pinned Lean declarations and makes no claim to reverify the old68/17/8/16 baseline inventories. The original packet/suggested blobs were independently hash-verified; the scoped `data/library-coverage.json` read used base `8ccfd68a38a91121df6cbfd0fc26e3d2d6a0ccb8` and source blob `5e708cfc74a51b10e62149113872fe4e00eb5846`.

Reviewed relevant audit entries: AF3(AUDIT13); AL0/AL1 and the beginning of AL2, AL3/AL5, R16.4/R16.5/R16.6, R17.3/R17.4(AUDIT14); R18.3(AUDIT15). They establish the coverage boundary used here: no adelic cusp/Whittaker/automorphic-period/transfer carriers, only classical modular-form shadows and elementary matrix/representation carriers. A search audit is not a fresh exact-statement baseline verification. Actual foreign packet contracts read include AF3 cusp/decay, AF4 rationality/cohomological inputs, AF5 algebraic forms, the three exact ALS5 comparisons, AL local bounds/poles and ModularSymbols L1’s Q scope. The accompanying sections give the other source checks; R18’s central quotient is explicitly still requested.

No new source-error entry is introduced. Existing sourceIssues elsewhere are not represented as freshly reverified by this narrow review. Failed acquisition: Tunnell81 AMS PDF returned403/internal error; guessed CPS-II author path returned404; original nonnormal cubic CRAS note was not acquired. JPSS GL3II scan was downloaded but unread as noted below. These failures do not become citations proving the original construction.

### Validation

the packet-check results below records the final source-checker invocation: four packets, zero errors, zero per-packet warnings; node counts123,55,57,58 and API/test counts137/118,48/37,33/29,65/49. The checker’s external warning says no local declaration index was present, so baseline references were checked for form only. The schema checker does not establish theorem truth or Lean elaboration.

the static consistency checks records comment/string balance, named section/namespace balance, qualified-declaration duplicate scan and absence of executable references to removed declarations: all four pass. The retained `indefinite_parity` is intentionally excluded from the removed-name set. Concrete adjoint tests retain their packet labels. No compiler/build was run, and historical build statements must not be interpreted as verification of these edits.

### Primary-source acquisition and exact reading ledger

Full SHA256 hashes and byte counts are in the following primary-source ledger. The following account is the actual read scope, not the bibliography’s advertised coverage.

#### cogdell-converse

URL: https://people.math.osu.edu/cogdell.1/PSCT-www.pdf

Version: Author exposition, Piatetski-Shapiro’s work on converse theorems; 21-page copy. SHA256 `0c922b6e6c26bc6d98ad7cf1162955d34e61491a1e73dc1f803b987cab2f2ffe` (377563bytes).

Read scope: §2 pp.5–6; §3 Theorems3.1–3.3 and outlines pp.6–9; application p.10. Full-rank n≥2 twists1..n−1; reduced-rank n≥3 twists1..n−2; twists unramified at S; empty/nonempty S outputs distinguished. This is a source-authored survey, not verification of the original proof interiors.

#### cogdell-fields

URL: https://people.math.osu.edu/cogdell.1/fields-www.pdf

Version: Author copy, Lectures on L-functions, converse theorems, and functoriality for GL_n; 109 PDF pages. SHA256 `2c5ec050a6db216dcd2104b7fe266ddc03e4db7c7d300239e60d6ee9c40618a7` (688257bytes).

Read scope: Printed29–34 (PDF33–38): Fourier reconstruction, local continuous uniqueness, global genericity/factorization, complete ordinary-multiplicity-one proof. Printed41–43: mirabolic unfolding/continuation context. Printed71–72 and74–75: unitary Rankin–Selberg poles and omitted finite/archimedean-factor regularity in strong multiplicity one. Printed73 not claimed read.

#### cogdell-columbia

URL: https://people.math.osu.edu/cogdell.1/columbia-www.pdf

Version: Author Rankin–Selberg lecture notes; 23 pages. SHA256 `af30e11206e1d5c661bb75c9ee938048d9b39cd64463a18893add4321ab7b2b7` (242110bytes).

Read scope: pp.4–5: determinant normalization of projection and global integral; mirabolic theta/Mellin construction, unitary norm-twist poles, and dual functional equation. Substitution confirms no extra determinant/eta factor in the quoted mirabolic FE.

#### gelbart-jacquet

URL: https://www.numdam.org/article/ASENS_1978_4_11_4_471_0.pdf

Version: Version of record, Ann. Sci. ENS11(1978),471–542. SHA256 `319347503f91fe22bec22ce7519b9ebaf09921ec4de8756c51d155864b4fc16a` (5996144bytes).

Read scope: Printed531–534 (PDF62–65), §§9.1–9.2, cases(i)–(v), Theorem9.3 beginning. T-highly-ramified twist conditions are not the S-unramified survey variant. §§5–8 metaplectic/twisted-symmetric-square proof interiors and the whole §§9.4–9.8 elimination argument were not freshly read.

#### cps-converse-I

URL: https://www.numdam.org/item/PMIHES_1994__79__157_0.pdf

Version: Version of record, Cogdell–Piatetski-Shapiro, Converse theorems for GL_n, Publ. Math. IHES79(1994),157–214. SHA256 `3cda27c4464d0ebcc93ff70cfcdd252fb21739450c773ee6fea61740e29c2950` (6239938bytes).

Read scope: PDF1–4 including printed157–159 definitions of archimedean models and Whittaker type; printed165–166 Theorems1/3 and printed166–168 opening proof. Selected statements and opening proof only. Theorem3 has twists unramified outside S with additional conditions; it must not replace the survey’s unramified-at-S theorem. Original reduced-rank proof not acquired.

#### jpss-gl3-II

URL: https://www.math.columbia.edu/~hj/Automorphic%20forms%20on%20GL(3)%20II.pdf

Version: Jacquet–Piatetski-Shapiro–Shalika, Automorphic forms on GL(3), II, scan. SHA256 `0cf1baf41a6279cd1f78b44b0e6d3ff0ed71f7b9b54b55de28210b9f02a293f7` (3377321bytes).

Read scope: Downloaded but text extraction was essentially empty; no fresh image/OCR proof reading claimed. This file is acquisition evidence only, not a verified proof source.

#### khare-wintenberger

URL: https://www.math.ucla.edu/~shekhar/papers/proofs.pdf

Version: Author copy dated30May2009 of Serre’s modularity conjecture(II), Invent.Math.178(2009),505–586; exact packet SHA. SHA256 `53f45f8be3b3c7de19f42417920d34a809e908412826490ebed90f07c8e86ed4` (732387bytes).

Read scope: pp.57–67, including §7 opening definitions, Lemma7.1, §7.2 exponents, Lemma7.3, §7.4 diamond quotient/freeness, Corollary7.5 and §7.5 dyadic twist. p.62 reread in final pass. Lemma7.1 applies to finite-dimensional residual coefficients, not arbitrary O-algebras; Cor7.5 separately uses characteristic-zero rank comparison and residual injectivity. No fresh version-of-record collation or new source erratum claimed.

#### taylor-meromorphic

URL: https://ems.press/content/book-chapter-files/27484?nt=1

Version: Richard Taylor, On the meromorphic continuation of degree two L-functions, Documenta Math.Extra Volume Coates(2006),729–779. SHA256 `6ec26bfc12e1cf38d410b36c18f985e2fb26c1cb1bb03d6e5197ccf58f92c51c` (487410bytes).

Read scope: Printed738 Lemma1.1/Cor1.2;740 Lemma1.3 and741–742 comparison proof/pairing. Printed739 only partially inspected, not claimed completely read. Prime-to-p effective stabilizers justify averaging/base change; the factorial coefficient pairing has weight range2≤k≤p+1; characteristic-zero JL comparison is not integral module equality.

#### cdn20

URL: https://arxiv.org/pdf/1704.08928v2

Version: Colmez–Dospinescu–Nizioł v2,7June2018, later JAMS33(2020). SHA256 `15e4868f5b11ad113e2806b5e9884d7b100f529e67c6cd6030f24cf8e3ae9073` (765912bytes).

Read scope: pp.41–42 §5.2.1 Proposition5.2 and proof: weight-two definite forms, possible coefficient enlargement, characteristic-zero JL and cohomological multiplicity comparison, strong multiplicity one determines omitted component. No fresh final-journal collation claimed.

#### raghuram2016

URL: https://repository.ias.ac.in/105986/1/GL%28n%29xGL%28n-1%29-revised.pdf

Version: Author revised manuscript dated28August2014, published Forum Math.28(2016),457–489. SHA256 `ccf394c4e93f69f12dc253b22c40c5d8d42693d9940daa0c6cd981bd3f61c5b7` (772841bytes).

Read scope: Intro pp.1–2 and complete §2.5.2 pp.24–25 from page-limited extraction. Strongly pure regular algebraic coefficient weight, permissible signature, one-dimensional bottom-degree infinity cohomology; Whittaker/Betti rational structures and period ambiguity; Gauss exponent n(n−1)/2 and corrected signature notation. Original Raghuram–Shahidi proof interiors not read, so G12 remains.

#### yu2023

URL: https://arxiv.org/pdf/1807.04659v5

Version: Hongjie Yu arXiv1807.04659v5,18July2022. SHA256 `9383bcdee14777ec647ba2658da3319d7d43864f9481b07c7d9550f1a454de1c` (990936bytes).

Read scope: §5.3.1 pp.36–38 and Lemma5.3.3: function-field Fourier reconstruction preceding Whittaker factorization, spherical line and conductor-dependent normalization. Consumer exposition, not a fresh proof of general local uniqueness. No final-journal collation claimed.

## Detailed review: Theta, Jacobi, quadratic invariants and the Gross–Zagier consumer

### Scope and evidence boundaries

The full issue, binding worker/blueprint/browser/upstream/expansion protocols, original claims, independent verifier evidence, round-3 fix report and preceding round-2 review were read. Packet statements, hypotheses, proof steps, prerequisites, relevant API/tests and matching suggested signatures were inspected at the affected contracts. the scoped contract inventory records exact IDs and zero-based packet indices: MP.0 indices18–39,44–45,87–96,98–104,107–117,125,138,140,148,174–175; MP.8 indices15,17,20,22–27,30,50,53–54,74; GZ indices34,35,239; QM indices105–111,117,121,125–127,144–145,175. This is **not** a new complete review of all 1,039 nodes in the four packets, nor a fresh proof certification of every historical source attached to those contracts.

Primary source passages were read directly, including the proofs needed to determine the ownership boundary, normalization and source hypotheses. The exact YZZ 2013 publication was not reacquired; the recovered 2011 author draft has a separate source ID and hash. GQT's full inductive proof and Waldspurger's original split Shimizu proof were not reconstructed. Gan–Takeda's full §§4–7 proof, original Kudla/MVW sources and the general archimedean/automatic-continuity proof chain remain the existing source-proof obligations.

### /19 — quadratic Siegel–Weil suppliers and the GZ consumer

**Verdict: corrected target/routing; the exact split Shimizu comparison remains an explicit source-proof obligation.** MP.6 now names the binary norm and ternary trace-zero inputs, and GZ.5 imports those nodes. There is no direct MP prerequisite on a GZ node or stage in the current packet (the explicit dependency check). This preserves the producer→consumer direction.

Fresh GQT v3 checks give the following rank-one orthogonal table, with `n=1`, `d(n)=n+1=2` and the source's quotient/Haar normalization:

| Datum | `(m,r)` | Valid exported statement |
|---|---|---|
| Quadratic-field norm | `(2,0)` | Ordinary anisotropic integral |
| Division-quaternion trace-zero norm | `(3,0)` | Ordinary anisotropic integral |
| Split binary hyperbolic norm | `(2,1)` | Exceptional boundary: `A₀=B₋₁=0`, `A₁=B₀` |
| Split trace-zero ternary norm | `(3,1)` | `A₋₁=B₋₂`; `A₀=B₋₁` only modulo `Im A₋₁`, with anisotropic complementary correction zero |

The convergence inequality is strict: `r=0` or `m−r>n+1`. The ordinary ternary split integral is outside it. The anisotropic scalar is `c·τ(H)/[E:F]`, with `c=1` for `s₀>0` and `c=2` for `s₀≤0`. GQT's exceptional split `O(1,1)` must not be folded into a generic `A₀=2B₋₁` claim. The source's second-term quotient cannot become literal equality just because the complementary correction is zero.

The YZZ author draft is more precise than the inherited proposed split proof route. Theorem2.1.1 (pp.43–44) gives probability-measure Siegel–Weil for anisotropic spaces or `m−r>2`, with factor2 in ranks1/2 and factor1 in higher rank. Its binary input is a **nontrivial quadratic field**; that norm and its scalar multiple `Kj` stay anisotropic even when the containing quaternion algebra is `M₂(F)`. A split binary norm is a useful additional MP supplier case, but it is not this GZ quadratic-field input.

Proposition2.2.1 (p.48) explicitly gives its Siegel–Weil proof only for nonsplit quaternion `B`. It sends split `B` to Waldspurger's original, different proof. Thus a generic GQT split ternary quotient identity does not, by itself, supply the normalized split Shimizu/Petersson contraction. The packet now asks for that exact factorization or a separately sourced comparison that disposes of every residual/cuspidal-projection term. It does not use the downstream Waldspurger period formula to prove its own input.

The local nonzero-norm formula (§2.1.6, pp.45–46) is for `a∈F×`, with the coarea/Fourier measure normalization. It is not a zero-shell statement. The §2.2 proof uses `B=F⊕B₀`, the theta/Eisenstein comparison, cuspidality to remove the zero orbit and a single nonzero rational orbit. §§2.3–2.4 then preserve the central-character condition, local/global Shimizu factorization and the distinct torus and Petersson measures. The final probability-period constant is `ζ_F(2)L(1/2)/(8L(1,η)²L(1,π,ad))`; replacing each probability period by quotient-volume `2L(1,η)` multiplies their product by `4L(1,η)²`. GZ's formula is therefore retained, without division by a potentially zero bilinear pairing.

Corrections made:

- MP norm-instance source locator: exceptional boundary is Theorem7.3(ii) p.34; the second-term theorem is Theorem8.1 p.35, not §8.1 on p.34. MP second-term hypotheses separately contained nonexistent Theorem9.1 and now cite Theorems1.2/8.1.
- The proposed `normTheta_integralRange` was false for arbitrary integers despite its prose disclaimer. Its signature now explicitly assumes `n=1`, `m=2∨m=3`, `r=0∨r=1`. For these four cases its displayed disjunction is valid. It remains an elementary range fragment, not a norm-form construction or normalization proof.
- MP toric interface, GZ coherent specialization and GZ Waldspurger proof route now distinguish quadratic-field anisotropy, nonsplit ternary proof and separate split comparison. Source-qualified gaps and matching suggested comments were updated. Omitted unsafe GZ theorems were not restored.
- A new, distinct `yzz-gross-zagier-shimura-curves-2011-draft` source/version was added to MP and GZ and to the three relevant references. No inherited 2013 source flag, excerpt, hash or publication-pagination claim was promoted.

Remaining scope limitations: native oscillatory/Schwartz, quotient measures, ramified factors, actual smooth representation pairings and the original split proof remain required. MP's broad false scalar pairing/theta signatures have not become valid because the ownership edge is now right. The prior packet review still requires their correction; this narrow review does not certify them.

### /20 — one Jacobi owner and independent special-function inputs

**Verdict: ownership fix accepted after the small corrections below; classical/unitary output requests and broader packet failures remain open.** MP.6 is the common Jacobi producer; MP.8 owns its BFH genus-two/GSp₄ realization, and QM.1 owns classical specializations, eta/theta/q-series applications and weak-form operations. The four existing MP.6 adelic contracts are real nodes, but do not yet supply all of QM's binding matrix-index classical request (a)–(e). They are not a proof of a general unitary Jacobi theorem. The verified unitary consumer is `AutomorphicCongruences:L2s`, not an inferred L2 edge.

Skoruppa v1 §4 gives the discrete right-action law `(A,X)(A′,X′)=(AA′,XA′+X′)`, the modular and elliptic slash operators, the half-weight metaplectic factor and every-cusp Fourier support `4l−F⁻¹[r]≥0` (strict for cusp forms). The supplier must compare that convention with native `N⋊G`, whose multiplication uses a left action; naming a semidirect product does not establish this bridge. Its Theorem5 uses a finite-index `Γ`, a finite-dimensional `V` on which Γ has **finite image**, and a **balanced** tensor product over `ℂ[Mp₂(ℤ)]` with the dual finite Weil module. The source proof chooses a finite-index subgroup fixing `V` and uses the elliptic theta basis. The packet request correctly retains those conditions.

Half-integral scalar index is outside Skoruppa's basic matrix-index definition. The `z↦2z` comparison sends it to index `4m` with an explicit half-lattice condition; alternatively the Heisenberg center must carry the extra scalar. The existing QM comparison and test at `m=1/2` correctly expose the failure of the naive center-free law. For the odd theta example, Skoruppa's convention differs by `−i` from QM's theta. The dual Weil representation, not the original Weil representation, acts on theta coefficients.

BFH's published pp.547 and552–553 were visually checked: its Jacobi translation lattice, scalar factors, residue indexing modulo `2m/N`, factor `1/(2m)`, branch of `sqrt(−det Z)` and scaled variables `N^(1−2j)Z,N^(1−j)W` belong to its genus-two realization. Proposition2.2's argument uses holomorphy in `W`; translation equations alone do not impose the complete weight/cuspidal conditions of a general classical Jacobi form. Keeping these normalization consumers in MP.8 is correct.

The four MP.7 stage-QM.2 imports were already replaced correctly in round3:

| MP consumer | Exact supplier | Unresolved analytic extension |
|---|---|---|
| half-weight Fourier expansion | AS.0/dit-112 | Whittaker W, positive real argument; compact-parameter derivative/end-point control |
| half-weight Poincaré family | AS.0/dit-112 | Whittaker M and continued exceptional-parameter domains |
| plus Bessel coefficient | QM.2/modified-bessel-function-i and QM.2/bessel-function-j | Complex order `2s−1`, locally uniform differentiated bounds |
| negative cycle Poincaré sum | QM.2/bessel-function-j | Complex order `s−1/2`, cycle and small-argument estimates |

The I/J series and native `Complex.regularizedHGFun` carrier accept complex order. Their existing real-order bounds cannot silently stand in for complex-parameter uniform bounds; MP requests24–26 correctly retain those extensions. DIT16 §§8–9 gives I for negative coefficient product and J for positive product; its negative-discriminant cycle calculation needs the inherited orientation and end-point corrections. The sign of the circle kernel is `−it` for the source's `z→γ_Q z` orientation, clockwise when `a>0`. The printed `O(y^(1+ε))` hypothesis is too strong for the substituted `y^(s−1)` at merely `Re s>1`; the weaker bound with the weight2 automorphy factor or continuation from `Re s>2` remains necessary. No inherited numerical computations were represented as rerun here.

the explicit dependency check verifies that each I/J/MW **carrier node closure** ends in named Mathlib declarations and never reaches QM.1. The current AS broad QM.2 consumers are precisely `AS.0/dit-113` and `AS.0/gz-217` for missing K-Bessel outputs. The spectral corrections also added the direct dit-112 prerequisites to dit-113/114. This is not a claim that the entire atlas is acyclic: MP theta-multiplier/theta-residue nodes still use QM.1 theta nonvanishing, and coarse stage/K/theta-prefix issues remain. The existing accurate QSeries restructure[1] proposal was preserved.

Corrections made: MP.8's stale restructure text and roadmap list now name only the verified L2s unitary consumer. QM node126's headline now states the balanced tensor and finite-image hypotheses already required by its detailed request/proof, and the matching suggested comment says the same. No artificial general Jacobi carrier was added. The seven classical importer nodes and eighth comparison retain their MP.6 stage prerequisites until the requested supplier outputs actually exist.

### /21 — smooth representation category before local theta

**Verdict: accepted as the ownership correction; existing local-theta proof/signature blockers remain.** The appropriate early supplier is SR.0's smooth complex representation category and abelian-category component, not the later derived category. The definition is every vector having an open stabilizer, and the supplier contract includes smooth vectors, morphisms, kernels/cokernels and quotient closure. SR.2 supplies normalized induction and Jacquet modules with a specified square-root modulus and coefficient restrictions; SR.3 supplies admissible contragredients and the applicable finite-length facts. SR.2a's opposite-parabolic second adjunction is distinct from the first adjunction. The packets for SR were not available at the input base (the full packet inventory was checked), so exact stage requests remain appropriate.

Kudla II.2 pp.31–33 uses the maximal π-isotypic quotient with matched genuine central character. His older Howe principle is in the odd-residual-characteristic regime. Gan–Takeda v4 Theorems1.1–1.3 and §2 distinguish field characteristic≠2 from residual characteristic, include dyadic residual fields for the orthogonal/symplectic and unitary theorem, and give only the stated Hermitian/unitary partial result for quaternionic pairs. §2.4 fixes normalized induction/Jacquet adjunctions; §2.7 uses the covariant MVW involution; §3.1 fixes the character twists in Kudla's filtration. The generic algebraic coinvariant quotient is a baseline carrier, not a proof of smoothness, finite length, irreducibility or Howe duality.

The inherited Kudla central-twist error was freshly confirmed at II.4 pp.36–37: with `λ(z)=z²`, two weight-one factors need `λ⁻¹` to reach weight0, and the ordinary dual needs `λ` to return from weight−1 to weight1. The printed powers `λ⁻²`/`λ²` are wrong. That repair remains intact.

The assigned ownership route is correct, but the suggested file still has the broader review's unsafe universal theta finite-length/Howe statements for arbitrary representation data. The big-theta quotient's extra H-action requires a genuine commuting action and a smooth quotient comparison. These are concrete retained signature obligations, not a reason to move SR's general category theory into MP. No new category was defined. The inaccessible Kudla URL was replaced by the live Toronto author URL serving the exact inherited bytes.

### /22 — local invariants and global coherence have different owners

**Verdict: corrected.** QFI6C is the correct local Hilbert/Hasse supplier, including real and dyadic fields. Its native symbol is `{±1}` (the upstream carrier is `ℤˣ`), with explicit norm-equation/cohomological comparison; MP keeps the analytic Weil index and its adelic Poisson product. No private complex-valued duplicate Hilbert symbol is introduced.

Weil's Fourier scalar uses the **full polar** form. Kudla's diagonal identity uses `det q=∏a_i`, whereas `det B_q=2^d∏a_i`; plain and signed discriminants also differ and must not be conflated. The normalized identities, hyperbolic triviality and conjugation follow from the Witt-character/Gauss arguments in the inspected sources. The real test requires its stated character `exp(2πit)`; the Q₂ test requires `exp(−2πi frac₂(t))`. The latter's quotient `½ℤ₂/ℤ₂` gives the phase `(1−i)/sqrt2`. Dyadic lattice triviality of `ψq` is stronger than merely polar isotropy, exactly as Weil notes. A generic formal `ψ` or arbitrary scalar functions cannot prove these tests.

One remaining ownership statement was wrong: MP requested “global coherent-collection classification” from QFI6C and node104 explicitly attributed global existence to QFI. The inspected upstream QFI scope excludes global classification. **GlobalQuadraticForms Layers3,7,8** instead owns admissible invariant systems, existence with actual local isometries, and classification. The packet now imports and requests each exact stage. The contract retains a single global discriminant, all real signatures, finite support, the local rank1/rank2 realization exceptions and the global product constraint. Product1 alone is not sufficient. Rank0 is handled separately. A general Hermitian analogue is not asserted to follow from this quadratic roadmap; it remains a source-qualified extension. Node104's hypothesis/proof/gap and suggested comment were aligned with this split.

### /23 — theta growth uses early AA/AF analysis

**Verdict: accepted as the ownership correction; the stronger theta estimates remain required.** MP.5 correctly imports the exact AA.3 adelic Siegel-set/covering/height nodes and AF.2 uniform moderate growth before any MP.6/7 theta consumer. AF.3 supplies cusp rapid decay. The generic estimates are not replanned under a later AS or MP.8 theorem.

Weil III.41 Theorem6 and Lemmas4–5 prove rational invariance, continuity and compact-family Schwartz majorants/normal convergence. They do not by themselves prove all of MP's all-derivative uniform moderate growth assertion. A common polynomial exponent for the complete derivative family, matched Schwartz seminorms and cover/base height comparison is still required; separate exponents for individual derivatives do not suffice. GQT §2.10 intentionally omits K-finiteness so the full real group can act; the K-finite core instead carries its `(g,K)` and finite-adelic actions. The packet now keeps that distinction.

Cuspidal rapid decay paired with an established moderate-growth theta bound can give integrability after a majorant is proved. It does not make the unweighted split theta integral converge outside Weil's range. GQT §3.2 instead uses an explicit regularizing operator that makes the theta kernel rapidly decreasing. A compact anisotropic torus also does not control a second noncompact companion quotient. These distinctions survive in the packet's requests/gaps. The remaining arbitrary-function growth/integrability prototypes are among the broader MP signature failures and remain grounds for `needs_changes`.

### Source access and version record

All PDF SHA256 values below were recomputed from the acquired bytes. Only the listed passages were freshly checked for this review; source acquisition is not full-paper collation.

| Source | Public version and fresh passages | SHA256 |
|---|---|---|
| Gan–Qiu–Takeda | [arXiv1207.4709v3](https://arxiv.org/pdf/1207.4709v3), 21Jan2014; pp.3,5–6,11,13–14,33–35,52. Convergence, measures, automorphic-space convention and first/second-term theorem statements; complete induction not audited. | `cde6b7ad22b974d4159f8cedd1e14a00bf4b05ec977ab750b54fdceb067adac5` |
| Kudla | [1996 author notes](https://www.math.toronto.edu/skudla/castle.pdf), I.4 pp.17–18, II.2 pp.31–33, II.4 pp.36–37; live host serves the same inherited PDF. | `800ed01b22fa6104a3292a8b2ef124cd69781a6904f626f71fcf2a30a9af8cdd` |
| Weil | [Acta111(1964)143–211 scan](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/weil2.pdf), printed161–162,171–176,193–194 / PDF19–20,29–34,51–52, visually inspected. Fourier scalar, polar form, real/complex/Gauss/Witt arguments, theta invariance and continuity. | `22df47cb98307aa77c46028cf5575eeb1d3524950dbdadb9c0c21890966039d2` |
| Gan–Takeda | [arXiv1407.1995v4](https://arxiv.org/pdf/1407.1995v4), pp.1–9, theorem scope, smooth categories, twists, normalized functors and proof division. Full subsequent proof not audited. | `89972dcc033e93feb2a483d44a5c03569fecb026079c0f2152f05c90f6f6a561` |
| Skoruppa | [arXiv0707.0718v1](https://arxiv.org/pdf/0707.0718v1), 5July2007, pp.4–7,10–13; notation, finite Weil module, Jacobi laws, Theorem5 and proof. CUP2008 publication not acquired. | `a4cc378e16a7dfb361e3914bbaa5e02b10567ced8802267c09fcfa4b368407a0` |
| BFH | [Invent102(1990)543–618](https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf), printed547,552–553 / physical6,11–12, visually inspected. No fresh adjudication of its eight unrelated source issues. | `d50ad2f11c992591de90f2cea59489ac436cce455e140e6eebf5053f49819f2c` |
| Duke–Imamoğlu–Tóth | [Annals184(2016)949–990](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), printed953–954,976,978–980 / PDF5–6,28,30–32: orientation, Fourier normalization, Lemmas5–7 and small-argument hypothesis. | `a67de7157f76ee700bc2e6a0034a920adc390022d4ff528aa80084f829f35f61` |
| Yuan–Zhang–Zhang | [6Nov2011 author-uploaded draft](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf?origin=publication_detail),266pp; printed/PDF20–23,43–55. Separate source ID; the inherited 2013 publication is not certified. | `7a6b79df81cf5d88e8a4bfbad5a2a9502dcb7b4ac16631e3d270c69bb71a7235` |

Also freshly opened [DLMF10.25](https://dlmf.nist.gov/10.25) and [DLMF10.2](https://dlmf.nist.gov/10.2), version1.2.8/release2026-09-15, equations10.25.2/10.2.2 and branch/complex-order descriptions. The spectral section separately checks DIT11's Whittaker supplier; its public PDF is `https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n2-p08-p.pdf`, hash `8f2b8ed3518fe69f08a72ef0ed3311d30523042335d4bd0e1ffd82d84459a010`. This part of the review does not claim an independent full DIT11 reading.

Fresh source-issue spot checks were Skoruppa E210/E211/E212 (wrong square-root numerator, cusp-condition label/missing group action, reversed character-module notation), Kudla genuine twists and DIT16 E28/E30 as described above. The independent prior correction/version labels were preserved. No new source erratum or exhaustive correction search is claimed.

### Pinned carriers and upstream contracts actually checked

Mathlib commit `082e2d37e8b0463410cdb532e111cd43d5a66174` was used. Five exact Git blobs were fetched and independently checked. Baseline rows were not changed.

| File / declarations | Git blob | Check |
|---|---|---|
| `RepresentationTheory/Coinvariants.lean`: `Representation.Coinvariants`, quotient map/lift universal property | `9f57ac8e1b100882e2da7fe3f9939f27178ac0ab` | Algebraic carrier only; not smoothness or finite length |
| `GroupTheory/SemidirectProduct.lean`: structure, multiplication, `lift` | `a7e1e5a2eadab620ed4d9b37cab46578ca482fc9` | Actual native left-action multiplication and covariance needed for a representation |
| `RingTheory/Artinian/Defs.lean`: `IsArtinian` | `9a660f364d60c202a3b54a0efa48f9afdbca5007` | Well-founded submodule inclusion; generic existence does not imply theta finite length |
| `Analysis/SpecialFunctions/RegularizedHypergeometric.lean`: coefficient, series/function, infinite-radius theorem | `5835678327c06fb3961637b3741b6088b6fc6726` | Native complex parameters and card-condition infinite radius for ₀F̃₁ |
| `NumberTheory/ModularForms/JacobiTheta/OneVariable.lean`: `jacobiTheta`, `jacobiTheta_S_smul` | `50f73393eb58b1d2a5c2b61465d9cf0a7d9498b9` | `exp(πi n²τ)` normalization and `(-iτ)^(1/2)` S-factor |

Tau Ceti's declared baseline remains `f790474821cf4256814db967cb154e7af3d0c369`; this part of the review added no new Tau Ceti implementation citation and does not claim a fresh audit of all Tau Ceti declarations. Attempts to read roadmap Markdown as Tau Ceti source files returned404; the actual upstream roadmap documents were instead read at the explorer input commit. This distinction is recorded, not concealed as an implementation lookup.

Selected upstream contracts read: QuadraticFormInvariants intro/scope and Layer6C (local symbol/Hasse/cohomological bridge); ModularForms intro and weight/finite-dimensional module boundary; GlobalQuadraticForms scope/cross-contracts/conventions, Layers3,7,8 (full relevant subcontracts); SR.0/0:abelian-category,SR.2/2a,SR.3/3a stage extracts; AA.3 adelic Siegel-set/covering/height nodes and AF.2 uniform growth/AF.3 rapid-decay nodes. These were contract reads, not claims that planned supplier code exists. The source and declaration checks are listed here and summarized in the final validation section.

### Required reader synchronization outside the editable scope

Readers were not allowlisted for #6902 and have not been edited. The following exact locations remain misleading independently of these packet corrections:

| Reader | Location / correction needed |
|---|---|
| `MetaplecticAutomorphicForms--MP.0.md` | line4151 has the old first-term/boundary locator; packet node102 already correctly names Theorems7.3(ii)/7.4. Lines4203ff and6795 still route global classification to QFI; synchronize GlobalQuadraticForms Layers3/7/8 and the separate Hermitian obligation. Line4577 has the old boundary locator; line4579 needs the explicit finite rank/dimension signature boundary. |
| Same MP.0 reader | lines4811–4834 retain the oversimplified split regularization and blanket unread toric claim. **Line4823 still includes `GrossZagierAndArithmeticHeights:GZ.5` as a prerequisite**, although the packet removed that consumer→producer edge. Synchronize the exact YZZ draft evidence, separate split proof and current prerequisites. The newly added source metadata/requests/gap also need rendering. |
| `MetaplecticAutomorphicForms--MP.8.md` | line19 claims converse-theorem L2 use. Replace with the verified `AutomorphicCongruences:L2s` unitary request. The broader review's gamma/chart/modulus/original-form reader repairs remain separate obligations, not certified by the small change here. |
| `GrossZagierAndArithmeticHeights--GZ.0.md` | lines1654–1656 still imply that generic first-/second-term identities establish the split pairing. Synchronize the quadratic-field binary norm, exact measures, nonsplit source proof, split gap and new distinct author-draft reference; the Waldspurger proof route around1668ff also needs that qualification. |
| `QSeriesPartitionsAndMockModularForms.md` | line958 omits the group-algebra balancing and finite-image condition. Line4156 describes four MP whole-QM.2 and broad AS imports that round3 already refined; render the accurate packet restructure[1] list. The existing request at4119 and round2 supplier/remaining text correctly preserve the unsupplied classical(a)–(e) contract. |

The round2 reader synchronization was checked read-only: QM opening ownership paragraphs, the expanded comparison including(c′), request(a)–(e), and both remaining-obligation copies are present. The graph paragraph is now stale because round3 changed later packet edges. QSeries topology~4 reader/export/matrix-cocycle obligations are independent and must not be dropped when the new review is installed.

### Scoped theta validation

`python scripts/check_blueprint.py` on the four canonical packets succeeds with **zero errors and zero warnings** after the corrections. No declaration index exists at the default checker path, so the checker validated baseline reference form only. The five pinned files listed above were separately checked against their exact blobs; this is not a fresh verification of all548 baseline rows in these four files. No link map or standalone restructure proposal was assigned or edited; the changed MP.8 proposal is embedded packet metadata. No Lean compilation was attempted. Existing source/packet API test descriptions were reviewed mathematically at the scoped boundary; proof-hole prototypes are not passing compiled unit tests.

## Detailed review: Algebraic groups, representation foundations and boundary cohomology

### 1. Finding /2 — one real classification/globalization owner

The AF.1b successor proposal includes Casselman embedding and Casselman–Wallach globalization, together with discrete series and Langlands classification. It does not move algebraic cochains out of AF.1a. BK v3's introduction and §9 make the dependence of the globalization proof on discrete-series/classification reductions explicit; embedding alone is insufficient. The matrix-coefficient definition takes an already supplied SF or unitary Hilbert realization, and therefore does not assume the globalization theorem to state its own prerequisite.

AF.1/principal-series presently treats a minimal parabolic and a finite-dimensional inducing coefficient. That is insufficient for AS/ET's arbitrary supplied real Levi SF/Hilbert data. A precise AF gap now requests local normalized induction, fixed compact picture, parameter holomorphy and induction in stages, independently of global automorphic induction. BK **§9.3 pp.39–40**, including Proposition 9.6, is the relevant source: the proposition's irreducible good Harish–Chandra-module hypothesis is retained rather than silently generalized. The spectral correction replaces the offending AS global-induced-family edges with AF.1/sf-representation and this request.

Knapp's public author scan gives the real and complex GL_n classification/correspondence; source unavailability was a stale statement. K-finite coefficients mean both the vector and its continuous contragredient vector are K-finite. The Weil-group nonsplitting test now uses `(zj)^2=-|z|^2`, which rules out every order-two lift of conjugation; the order of the particular element j alone was insufficient. No complete proof audit of general real Langlands classification is claimed. Verdict: **corrected/verified**.

### 2. Finding /6 — absolute cochains/Kostant and arithmetic lattice comparison

AF.1a remains the sole requested owner of the full absolute E-linear Chevalley–Eilenberg complex and algebraic Kostant theorem; its existing complex-relative complex is not misidentified with that output. ALS.4 owns rational arithmetic-lattice Nomizu and transported-lattice Hecke comparison.

The coefficient in Nomizu is finite-dimensional algebraic. The rational comparison is extended to a number field E; the invariant differential-form realization is taken after a specified embedding E→C. The claimed algebraic M-action requires that V extend from N to P=M⋉N. A fixed nilmanifold has only the normalizer action; general rational Levi elements transport lattices and use refinement/transfer. Kostant's displayed irreducible-module sum uses a splitting coefficient field, compatible torus/Borel/parabolic and a dominant integral highest weight. HR's natural split GL_N formula is restricted to F totally real and its Galois E containing F; general reductive input retains the E₂ page with the separate splitting request.

Corrected HR v2 locators are **§4.2.1 pp.25–26**, (4.2) and Proposition 4.3 at p.26, and **§4.2.3 (4.5) p.27**. The previous §4.1 locators for these passages were wrong. This passage invokes the rational comparison, rather than providing its entire proof.

Concurrent ALS revision 2 had already added the split-field and totally-real restrictions. Its accepted review, all 66-node verdicts, baseline changes, 16 gaps, 19 requests, orientation/Hecke/source corrections and unrelated suggested catalogue were preserved. Only 11 scoped fields were ported; the ALS field-change index below records each before/after against new main. Suggested Nomizu/Kostant descriptions now match. Verdict: **corrected/verified**, conditional on the explicit requested suppliers, with the concrete remaining reader discrepancy below.

### 3. Finding /7 — Kneser–Tits and strong approximation

The requested local Kneser–Tits finite-index consequence belongs to RG2.4 for the characteristic-zero nonarchimedean simply connected absolutely almost simple isotropic group. Reading RG2.4's actual roadmap did not reveal an already supplied exact theorem; it remains a request. AA owns global strong approximation and the closure argument.

Rapinchuk Theorem 2.3/Remark 1 p.12 supplies the criterion, while the detailed §2.6 route on pp.16–17 actually treats Q and a single isotropic prime. AA's route now distinguishes that branch from native-number-field, several-place and anisotropic-local branches. Kneser–Tits alone does not establish every global closure branch.

The previous Lean `hsc`, universally turning arbitrary surjective Hopf maps into injective maps, was not the pinned simply-connectedness predicate. Its inaccurate `strongApproximation_of_simplyConnected` theorem prototype was replaced by a named omitted signature specifying the required semisimple, central-isogeny, absolute-simplicity and off-S adelic carriers. This omission is permitted, not a blocker. The existing `HasStrongApproximation` carrier only covers its archimedean S convention and is not advertised as arbitrary off-S data. Verdict: **corrected/verified**.

### 4. Finding /25 — cohomological representations and local range

The local representation-theoretic statements belong to AF.4, before ALS's global cohomological applications. Wigner requires the genuine central anti-involution and matching infinitesimal character. Compact central elements also act on the relative cochains: a nontrivial scalar ratio on an element of Z(G)∩K annihilates the cochains. This explicit compact-central obstruction was added.

The tempered range uses the split-central quotient and centrally balanced coefficients. HR v2 pp.17–19 supplies the GL_n specialization and its connected/finite component qualifications; it does not establish arbitrary-group cohomological induction. Ichino–Prasanna §7.1 pp.40–41 supplies the equal-rank Hermitian form of the Vogan–Zuckerman statement: a compact Cartan, theta-stable parabolic and its unitary character with the stated positivity condition. The packet retains that scope. The VZ scan introduction explicitly does not itself establish unitarity of all constructed modules, so this reading is not described as a full modern classification proof. Harris/Mirković proof availability metadata was reconciled with the prior public statement reading; the original Mirković proof remains unread. Verdict: **corrected/verified** within this source scope.

### 5. Finding /26 — spherical corner and Flath

SR.4 owns commutativity of the hyperspecial Hecke corner; AA.1 supplies good integral models at almost all places; AF applies these to irreducible admissible representations and then Flath's tensor factorization. Getz pp.35–41 gives the required finite-dimensional corner/simple-module route (Theorem 7.5, Proposition 7.9, Proposition 8.6 and Corollary 8.9). This is not restricted to the unitary dual.

The proof now explicitly uses **finite-dimensional complex** irreducible corner modules, because a general irreducible module over a commutative complex algebra need not have complex dimension one without a finiteness hypothesis. Admissibility supplies this hypothesis for V^K. The conclusion is dim V^K≤1; zero remains allowed. The spherical vectors used in the restricted tensor product are nonzero only at the places where the representation is unramified. Verdict: **corrected/verified**.

### 6. Finding /27 — integral unnormalized Satake

SR.2 owns unnormalized induction/modulus; SR.4 owns the integral unnormalized Satake and its explicit normalized comparison; RG2.4 owns the Iwasawa/decomposition input. The actual roadmap suppliers were read and remain stage requests, not fabricated existing packet outputs.

NT arXiv1511.04913v1 **§§2.2.3–2.2.4 pp.9–11**, Lemmas 2.4/2.7 and Corollaries 2.5/2.6, uses restriction followed by integration along N with volume-one integral coset formulas. There is no q-half in that integral transform. For GL₂ and the displayed f(tn) convention, S(T_p)=p[diag(p,1)]+[diag(1,p)]. Since delta_B(diag(p,1))=p^-1, multiplication by delta_B^(1/2) makes the normalized coefficients symmetric sqrt(p). The scalar extension/choice of square root belongs only to that conversion. ALS revision 2 already has this coefficient order and preserves it. The downloaded v1 is distinguished from the packet's inherited published DOI text/hash. Verdict: **verified**.

### 7. Finding /28 — neatness uses algebraic representations

AA.4 owns neatness and congruence-neat normal subgroups, including rational intersections at all adelic conjugates; ALS imports the result. Milne §3 p.34 defines neatness through a faithful **algebraic** representation and asserts independence and Proposition 3.5's finite-index congruence consequence.

The old suggested representation-independence theorem quantified arbitrary abstract point homomorphisms. That is invalid: on Q×, the algebraic identity sends 2 to a neat element, whereas q↦(-1)^v₂(q) sends it to torsion. New genuine coordinate predicates are `Neat.algebraicPointMap`, `IsAlgebraicPointHom`, and `IsFaithfulAlgebraicPointHom`. They use a Hopf map O(GL_n)→O(G), the pinned `GeneralLinear.pointsMulEquiv`, and a fixed embedding F→C. Faithful algebraic means a surjective coordinate-ring map (closed immersion); bare injectivity of F-points is insufficient. `isNeat_iff_of_faithful` now takes these hypotheses (its retained name denotes the existing one-way implication), and `exists_neat_normal` additionally takes finite type. The pointwise torsion consequence still legitimately only needs injectivity.

No unrelated AA level-quotient geometry was certified by this repair. Verdict: **corrected/verified**.

### 8. Finding /29 — pair and cochain ownership

AF.1a uniquely owns compatible pairs/modules, relative cochains and their algebraic prefix; AF.1 imports it. The GSp4 acceptance case uses the compact pair `(p_h/a_infinity,K^h/A_infinity)` on centrally balanced coefficients; K^h itself contains the noncompact split centre.

Getz Definition 5.14 p.26 imposes countability. Local K-finiteness/smooth finite orbit spans alone does not imply that countability: an uncountable direct sum of trivial representations is a counterexample. The packet now states the difference and identifies finite generation in the Harish–Chandra case as the source of countability. The accepted ownership proposal is an implementation-order request, not proof that the native coarse stage graph has already been rewritten. Verdict: **corrected/verified**.

### 9. Finding /30 — local algebraic prefix and rational comparison suffix

AF.4's local algebraic weights, coefficient/cohomological representation and degree statements precede global comparison. Rationality and torsion eigenclasses form the later suffix requiring the actual ALS Betti/Hecke and AS comparison. HR v2 §2.3.4 pp.14–15 gives the source-scoped GL_n rational structure/strong-multiplicity-one route. A general G rational cuspidal summand remains an explicit hypothesis/input, not something proved by Schur's lemma or bare finite-dimensional Betti cohomology.

The newform test fixes the cohomological finite-part normalization D_k(2−k); unitary half-power normalization need not preserve the same naive coefficient field. AL now owns Fourier→genericity/factorization→ordinary multiplicity one through its exact new `AL.3/global-multiplicity-one` node. AF does not claim an absent general GL_n global-genericity producer. Likewise AF's Clozel node does not supply AL's Whittaker comparison periods/Gauss twisting. AL retains those proofs with exact AF local inputs and ALS comparisons. The proposed suffix resolves the ownership requirement but is not a declaration that every existing coarse-stage edge is acyclic. Verdict: **corrected/verified**.

### 10. Finding /31 — generic algebraic modular forms, AF side

AF.5 owns the generic algebraic modular form function spaces, coefficient transport, restriction, trace and Hecke machinery. BCGP v1 §5.7 pp.130–133 uses the actual compact-at-infinity setting and a J-coefficient action with f(gu)=u^-1f(g). This is distinct from Gross's rational convention f(gamma g)=sigma(gamma)f(g), f(gu)=f(g).

The retained rational `AlgebraicModularForm` has genuine right-coset Hecke/trace formulas. `res` is now a linear map with evaluation/composition laws. `trace_res` equals the finite coset degree without requiring smallness. Added `LevelAlgebraicModularForm` is the actual J-coefficient submodule. `rationalEquiv` requires a representation tau of all G_f agreeing with sigma on rational points and has the formulas tau(g^-1)f(g), inverse tau(g)f(g). Arbitrary inertial types have no automatic extension. The new coefficient carrier has zero, trivial-action and transport-inverse examples, and the original rational examples remain.

The old non-small test incorrectly made invariants base-change failure automatic whenever p divides the stabilizer order. It now uses the valid C₂-sign representation over Z reducing modulo 2: integral invariants are zero and mod-2 invariants are all F₂. Trivial stabilizer action would contradict the former assertion.

R18's positive-unit-rank centre needs a central-character quotient extension, not the unchanged discrete-centre carrier. The packet now requests exactly f(gamma gzu)=psi(z)u^-1f(g), rational-central and J∩Z compatibility, central quotient double cosets and descended effective stabilizers. R18 retains its class-set/central and Taylor–Wiles-specific arguments. No existing AF exact export is falsely asserted to meet this new request. Verdict: **corrected/verified**, AF side only.

### Sources actually read and limits

the foundations source table below records URLs, local SHA-256 hashes and exact read limits; the retrieval record retains retrieval metadata. Actual reading comprised HR v2 pp.13–15,17–19,25–27; BK v3 introduction pp.2–4, Casselman p.22 and §9.3 pp.39–40; Rapinchuk pp.12,16–17; Getz p.26 and pp.35–41; BCGP v1 pp.130–133; NT v1 pp.9–11; IP §7.1 pp.40–41; VZ introduction pp.51–55. Knapp's scanned printed pp.395,400,403–406 were image-inspected here (source theorem/normalization statements; not a full classification proof). Earlier review source readings are not silently counted as this session's independent reading.

Milne direct download returned HTTP406; the public browser PDF text for §3 p.34 was readable. No independently recalculated Milne hash is claimed. The public Harris statement read by the preceding independent review is recorded as inherited rather than a new full source reread. No entire HC68, Casselman finite-length proof, Borel–Wallach general range proof, Schmid/BHR original proof, Mirković original proof or Clozel original proof was audited here.

### Pins and supplier verification

Pinned Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`: read `GeneralLinear/FunctorOfPoints.lean` (blob `37d3be183380903c29313cc3614c817a79ab9532`), coordinate `HopfAlgebra.lean` (blob `2511d8a5877f949585bb5e08e9a218afa0aaf53a`) and `SimplyConnected/Basic.lean` (blob `c6275c4e69956cf3663960ea90d7179859805c78`). The first gives the ordinary-order point-group equivalence; the second gives the coordinate Hopf carrier; the third defines simply connectedness on semisimple Hopf objects through central isogenies, not arbitrary surjective maps. Their declarations and enclosing hypotheses were inspected at those exact blobs.

Read fresh RG2/SR/ET roadmap extracts and the scoped audit rows AF.1/AF.1a, AA.4, ALS.4. The complete packet-directory inventory showed no exact RG2/SR/ET packets at the input base; named missing contracts remain stage requests. A guessed pinned Mathlib `Algebra/Lie/Cohomology/Basic.lean` fetch returned 404, so there is no claim of an independent current low-degree Lie-cochain source audit. That negative lookup does not establish absence; the existing relative-complex versus requested absolute-complex mismatch follows from the actual AF packet signatures and audit, not from the failed path guess.

### Whole-review status and concrete remaining obligations

**ALS:** preserve the new accepted revision-2 review as historical evidence. It explicitly revisited the old all-node defects, and its 114 missing APIs/80 omitted executable examples/44 omitted theorem signatures are honestly recorded permitted omissions. Our narrow correction does not revive the old needs_changes reasons. The complete amended deliverable still has the reader contradiction at line1503 below; synchronization is required before calling this amended reader accepted.

**AF:** the earlier 20-node unverifiable ledger contains stale references to removed false prototypes and corrected assertions. The present narrow review does not confirm a surviving false packet assertion merely from that ledger. In particular, omitted relative/globalization/Wigner signatures, unread original proof interiors and explicitly requested Betti/Hecke inputs are not independent rejection grounds. This pass did not re-audit the HC smoothing proof behind AF.2/uniform-growth, the compact-kernel estimates behind AF.3/cuspidal-spectrum-discrete, the full positive-component-to-disconnected GSp comparison behind AF.4's coherent nodes, or the original general rational-cuspidal-summand proof behind AF.4/clozel-rationality. Their precise current hypotheses and named gaps are retained; they are **unrevisited wider obligations**, not newly asserted false statements. The concrete unchanged reader contradictions below do independently prevent promotion of the whole deliverable.

**AA:** one expressible surviving prototype defect is `LevelMaps.levelMap_isCoveringMap` at suggested line2476. It accepts arbitrary `TopologicalSpace` instances on both quotient types, lacks actual quotient-topology compatibility and compact-open/finite-index hypotheses, and takes an arbitrary representation for neatness without faithful algebraicity. Even an identity map between arbitrarily chosen topologies need not be continuous. This is a genuine statement mismatch, distinct from missing future carriers; it is outside the assigned neatness algebraicity repair. Whole AA needs_changes remains justified. Its broader reduction/level-geometry review was not repeated.

### Reader drift outside edit scope

No reader was edited, as instructed. Exact current/new-main contradictions:

- `readmes/AutomorphicFormsOnReductiveGroups.md:393`: local finiteness is declared equivalent to Getz's countable direct-sum condition. An uncountable direct sum of trivial K-modules disproves this. Packet node9 now distinguishes them.
- Same reader line2685: invariants base-change inequality is asserted when p divides |Gamma_i|. A trivial Gamma_i-module disproves this universal assertion. Packet node87 and the suggested example now use the C₂ sign module instead.
- Same reader line1153 uses only j's order four as the nonsplitting argument. The conclusion is true but the supplied proof is insufficient; packet now rules out every lift of conjugation.
- **Concurrent/new accepted** `readmes/ArithmeticLocallySymmetricSpaces.md:1503`: V is only an N-representation but its Lie cohomology is assigned an algebraic M-action. No such action is canonically defined without P-extension data; the accompanying proof repeats that M acts on V. The amended packet/suggested version requires the extension and separates rational E-cohomology from the complex differential-form realization. HR v2 locator drift additionally remains at reader lines1521 and1552 (old §4.1 versus actual §4.2.1); this locator mismatch is not the reason for the substantive hold.

The corrected precise text is in the canonical packet. It is available for separately authorized reader synchronization. A narrow fix acceptance does not declare these reader statements correct.

### Validation and changed files

Ran `python3 scripts/check_blueprint.py` on all three canonical packets: zero errors and zero packet warnings. the packet-check results below records the output. The process additionally warned that the default global declaration index was absent, so this run checks reference form; changed pinned declarations were independently read as above. The final combined packet checks are documented below. No compilation is claimed or attempted. `rg` confirmed the renamed/retyped local consumers and source imports; no stale actual invocation of the omitted strong-approximation theorem remains in these three suggested files. Definitions retain at least three planned node tests.

Changed only the six authorized canonical files: the packets and suggested Lean files for AutomorphicFormsOnReductiveGroups, ArithmeticLocallySymmetricSpaces and AdelicAlgebraicGroups. Review metadata is installed centrally as specified above; readers are unchanged. the field-change appendix below contains the initial field journal; the ALS field-change index below supersedes its ALS portion against concurrent main. The final field appendix includes the spherical finite-dimensionality and Harris availability corrections. Existing incomplete proof bodies remain `sorry`; opaque fake propositions were not introduced.

## Foundations primary-source versions

Each hash identifies the bytes actually acquired. Unversioned public URLs below are fixed for this review by that hash; only the listed passages were read. Milne was read through public PDF text and has no newly computed hash.

| Source | Public version | SHA-256 | Actual reading |
|---|---|---|---|
| `hr-v2` | [Public source](https://arxiv.org/pdf/1405.6513v2) | `1d3af2de1c1a370dc339e10c74cda84f5e6f5b25c09810bfdf8bbbbc8df6ca06` | pp.13–15,17–19,25–27; §§2.3.4,3.1–3.2,4.2.1–4.2.3 |
| `bk-v3` | [Public source](https://arxiv.org/pdf/0812.1684v3) | `f5f2e79d87532c9ac46389d7eb1606e0301eac0ba7c7972ab628e278e091ca3e` | introduction pp.2–4, Casselman statement p.22, §9.3 pp.39–40 |
| `rapinchuk` | [Public source](https://arxiv.org/pdf/1207.4425) | `43f6a45ceb9e51e1ca959c0d0574474cb1c20ea5a4e13852eee1886aceadab97` | Theorem2.3/Remark1 p.12; §2.6 pp.16–17 |
| `milne-svi` | [Public source](https://www.jmilne.org/math/xnotes/svi.pdf) | Not independently hashed; direct download returned HTTP406. | browser PDF text §3 p.34; direct download HTTP406; no independent hash |
| `getz` | [Public source](https://sites.math.duke.edu/~jgetz/aut_reps.pdf) | `e52f7da0685c7e330f096b3f23beaf8832972067d191f77e3c05ac3113fff0ac` | Definition5.14 p.26; factorization/corner results pp.35–41 |
| `bcgp-v1` | [Public source](https://arxiv.org/pdf/2502.20645v1) | `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c` | §5.7 pp.130–133 |
| `knapp94` | [Public source](https://www.math.stonybrook.edu/~aknapp/pdf-files/motives.pdf) | `684de4bcfc50e448fe52fddc863392012581b43097f40f8bcc4c83dbc5a2dfbb` | image-inspected printed pp.395,400,403–406; classification/LLC statements and normalizations, not original proof interiors |
| `ip` | [Public source](https://arxiv.org/pdf/1806.10563) | `058fda94ad08d245dcdf01672e5915beacb8458e6b49498b7e15debbf828aad5` | §7.1 pp.40–41 |
| `nt16-v1` | [Public source](https://arxiv.org/pdf/1511.04913v1) | `2df7b65ab99a206a222ec133a866739187d64f193d9f295944a48dedfc9b49bd` | §§2.2.3–2.2.4 pp.9–11, Lemmas2.4/2.7 and related corollaries; v1 distinguished from published text |
| `vz` | [Public source](https://www.numdam.org/item/CM_1984__53_1_51_0.pdf) | `ccaaf5ad243ccb85d3db629ff7677ca5b80b7e2d71e502d21fa1b773863b78a4` | introduction pp.51–55 only; not full classification/unitarity proof |

## Pinned declarations freshly read for the spectral/IHG section

The following are scoped source reads at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All 23 containing files were checked against their Git blobs. The other subject sections list their additional, separately scoped checks.

| Declaration | Source at pin | Actual provided input |
|---|---|---|
| `mathlib:MeasureTheory.L2.inner_def` | [Mathlib/MeasureTheory/Function/L2Space.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Function/L2Space.lean) | For L² classes in an inner-product space, the inner product equals the integral of pointwise inner products. |
| `mathlib:MeasureTheory.integral_prod` | [Mathlib/MeasureTheory/Integral/Prod.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Integral/Prod.lean) | Bochner Fubini for integrable functions under the module and s-finite product-measure hypotheses. |
| `mathlib:MeasureTheory.integral_tsum` | [Mathlib/MeasureTheory/Integral/DominatedConvergence.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Integral/DominatedConvergence.lean) | Countable AEStronglyMeasurable family with finite sum of norm integrals permits interchange of Bochner integral and sum. |
| `mathlib:hasFDerivAt_integral_of_dominated_of_fderiv_le` | [Mathlib/Analysis/Calculus/ParametricIntegral.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Calculus/ParametricIntegral.lean) | Parameter-neighborhood differentiability with one integrable derivative majorant permits Fréchet differentiation under the integral. |
| `mathlib:hasDerivAt_integral_of_dominated_loc_of_deriv_le` | [Mathlib/Analysis/Calculus/ParametricIntegral.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Calculus/ParametricIntegral.lean) | RCLike parameter, eventual measurability, integrable value and derivative majorant give integrable derivative and differentiation under the integral. |
| `mathlib:WithSeminorms.banach_steinhaus` | [Mathlib/Analysis/LocallyConvex/Barrelled.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/LocallyConvex/Barrelled.lean) | Pointwise seminorm boundedness of continuous semilinear maps from a barrelled space gives uniform equicontinuity. |
| `mathlib:Complex.regularizedHGFun` | [Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean) | Regularized generalized hypergeometric power series with Pochhammer numerators and Gamma denominators. |
| `mathlib:Complex.radius_regularizedHGFunSeries_eq_top` | [Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean) | Infinite radius if the numerator multiset cardinal is at most the denominator multiset cardinal. |
| `mathlib:Complex.betaIntegral_eq_Gamma_mul_div` | [Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean) | For positive real parts, the beta integral equals Gamma(u)Gamma(v)/Gamma(u+v). |
| `mathlib:Complex.Gamma_mul_Gamma_add_half` | [Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean) | Legendre duplication with the factor 2^(1−2s)√π, using Mathlib totalized Gamma. |
| `tauceti:TauCeti.stdPeterWeylBasis` | [TauCeti/RepresentationTheory/Compact/PeterWeyl.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Compact/PeterWeyl.lean) | Hilbert basis of L² of a compact group for Haar probability, indexed by irreducibles and pairs of matrix indices. |
| `tauceti:IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul` | [TauCeti/Analysis/Semigroups/Group/Stone/Unbounded.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Semigroups/Group/Stone/Unbounded.lean) | A self-adjoint partial linear map on a complete complex Hilbert space is the generator iA of a unique unitary strongly continuous group. |
| `mathlib:MonoidHom.measurePreserving` | [Mathlib/MeasureTheory/Measure/Haar/Unique.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Measure/Haar/Unique.lean) | For a continuous surjective group homomorphism with compact codomain, Borel topological groups and Haar measures of equal total mass, the homomorphism is measure preserving. |
| `mathlib:UnitAddTorus.hasSum_mFourier_series_apply_of_summable` | [Mathlib/Analysis/Fourier/AddCircleMulti.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Fourier/AddCircleMulti.lean) | For a finite-dimensional unit torus, a continuous complex function with summable Fourier coefficients has its Fourier series converging to its value at every point. |
| `mathlib:AddChar.expect_eq_ite` | [Mathlib/Analysis/Fourier/FiniteAbelian/Orthogonality.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Fourier/FiniteAbelian/Orthogonality.lean) | On a finite additive group with characteristic-zero semifield values, normalized expectation of a character is one when it is the trivial character and zero otherwise. |
| `mathlib:UpperHalfPlane.cosh_dist` | [Mathlib/Analysis/Complex/UpperHalfPlane/Metric.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Complex/UpperHalfPlane/Metric.lean) | The hyperbolic cosh distance is 1+\|z−w\|²/(2 Im(z)Im(w)). |
| `mathlib:UpperHalfPlane.tanh_half_dist` | [Mathlib/Analysis/Complex/UpperHalfPlane/Metric.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Complex/UpperHalfPlane/Metric.lean) | The hyperbolic tanh half-distance is \|z−w\|/\|z−conj(w)\|. |
| `tauceti:TauCeti.vitali` | [TauCeti/Analysis/Complex/Conformal/Vitali.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Complex/Conformal/Vitali.lean) | For a locally bounded sequence of holomorphic scalar functions on an open preconnected complex domain, pointwise convergence on a subset with an interior accumulation point gives a holomorphic locally uniform limit. This is an interior theorem, not a boundary bound. |
| `mathlib:SchwartzMap` | [Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean) | Schwartz maps already support normed vector-valued targets; smoothness and all iterated Fréchet derivative decay are part of the definition. AS extends only to general quasi-complete locally convex targets. |
| `mathlib:SchwartzMap.postcompCLM` | [Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean) | Postcomposition by a continuous linear map is a continuous linear map between normed vector-valued Schwartz spaces; pointwise evaluation and composition laws are existing. |
| `mathlib:LinearMap.IsSymmetric.eigenvectorBasis` | [Mathlib/Analysis/InnerProductSpace/Spectrum.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/InnerProductSpace/Spectrum.lean) | For a finite-dimensional real/complex inner-product space and a symmetric linear endomorphism, gives a finite orthonormal eigenbasis sorted by eigenvalue. This is not an arbitrary infinite-dimensional compact-operator Hilbert basis. |
| `tauceti:IsCompactOperator.finiteDimensional_eigenspace` | [TauCeti/Analysis/Normed/Operator/Compact/Eigenspace.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Normed/Operator/Compact/Eigenspace.lean) | A compact continuous linear endomorphism over a complete nontrivially normed field has finite-dimensional eigenspace at every nonzero eigenvalue. |
| `tauceti:TauCeti.isFredholm_one_sub` | [TauCeti/Analysis/Fredholm/CompactPerturbation.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/Fredholm/CompactPerturbation.lean) | For a compact endomorphism of a complete normed space over a complete RCLike normed field, 1−K is Fredholm. No parameter-meromorphic inverse is supplied. |
| `tauceti:ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector` | [TauCeti/Analysis/InnerProductSpace/Spectrum.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Analysis/InnerProductSpace/Spectrum.lean) | A compact symmetric continuous endomorphism of a complete real or complex Hilbert space admits a Hilbert basis of eigenvectors, without a separability assumption. Applied to A* A, it provides the compact positive spectral decomposition used in the singular-value construction. |
| `mathlib:ModuleCat.finite_ext` | [Mathlib/Algebra/Category/ModuleCat/Ext/Finite.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/ModuleCat/Ext/Finite.lean) | For a commutative noetherian R and finite R-modules N,M, Ext^i_R(N,M) is finite for every natural i; the Small hypothesis handles universes. |
| `mathlib:DerivedCategory` | [Mathlib/Algebra/Homology/DerivedCategory/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean) | The derived category of an abelian category, formed by localization at quasi-isomorphisms; it has its triangulated structure. |
| `mathlib:DerivedCategory.Q` | [Mathlib/Algebra/Homology/DerivedCategory/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean) | The localization functor from integer-indexed cochain complexes to the derived category, sending quasi-isomorphisms to isomorphisms. |
| `mathlib:DerivedCategory.Qh` | [Mathlib/Algebra/Homology/DerivedCategory/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean) | The localization functor from the homotopy category, factoring the chain localization through homotopy classes. |
| `mathlib:Module.Projective` | [Mathlib/Algebra/Module/Projective.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Projective.lean) | The actual projectivity class, expressing a splitting of the canonical free-module surjection; pinned lines 67–74. |
| `mathlib:IsAdicComplete` | [Mathlib/RingTheory/AdicCompletion/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Basic.lean) | Separatedness and precompleteness for the module filtration by powers of the coefficient ideal; pinned lines 49–56. |

## Complete field-change index

This index names every changed packet field below the review metadata. Array indices are zero-based; the PR diff contains their exact old/new text. For ALS the comparison base is the newer accepted revision, so its unrelated corrections are not attributed to this review. Review metadata is replaced once per packet, and former review objects are archived in full. New source versions are kept distinct from inherited publication claims.


### GL2AutomorphicRepresentationsAndTransfer--R17.3

| Node | Changed fields |
|---|---|
| `GL2AutomorphicRepresentationsAndTransfer:R17.4/gl3-recognition` | `prerequisites/5`, `proofSteps/1`, `proofSteps/2`, `proofSteps/3`, `sources/4` |

Other fields: `sources/20`, `gaps/0/detail`, `gaps/7`.

### AutomorphicFormsOnReductiveGroups

| Node | Changed fields |
|---|---|
| `AutomorphicFormsOnReductiveGroups:AF.1a/gk-pair` | `acceptance/1` |
| `AutomorphicFormsOnReductiveGroups:AF.1a/gk-module` | `proofSteps/3`, `sources/0/match` |
| `AutomorphicFormsOnReductiveGroups:AF.1/tempered-square-integrable` | `hypotheses/3`, `statement` |
| `AutomorphicFormsOnReductiveGroups:AF.1/weil-group-real` | `tests/3/statement` |
| `AutomorphicFormsOnReductiveGroups:AF.1/archimedean-llc-gln` | `proofSteps/4` |
| `AutomorphicFormsOnReductiveGroups:AF.2/spherical-dimension-one` | `proofSteps/1` |
| `AutomorphicFormsOnReductiveGroups:AF.4/wigner-lemma` | `proofSteps/3`, `sources/1`, `statement` |
| `AutomorphicFormsOnReductiveGroups:AF.4/borel-wallach-tempered-range` | `sources/2` |
| `AutomorphicFormsOnReductiveGroups:AF.4/mirkovic-tempered-coherent` | `proofSteps/1` |
| `AutomorphicFormsOnReductiveGroups:AF.4/rationality-field` | `tests/3/statement` |
| `AutomorphicFormsOnReductiveGroups:AF.4/clozel-rationality` | `sources/2` |
| `AutomorphicFormsOnReductiveGroups:AF.5/algebraic-modular-forms` | `api/0/statement`, `api/1/name`, `api/1/role`, `api/1/statement`, `api/2/name`, `api/2/role`, `api/2/statement`, `api/3/name`, `api/3/statement`, `api/4/name`, `api/4/role`, `api/4/statement`, `api/5/name`, `api/5/role`, `api/5/statement`, `api/6/name`, `api/6/role`, `api/6/statement`, `api/7`, `tests/3/statement` |

Other fields: `sources/2/readSections/4`, `sources/30`, `gaps/20`, `gaps/21`.

### AutomorphicLFunctionsAndLocalFactors

| Node | Changed fields |
|---|---|
| `AutomorphicLFunctionsAndLocalFactors:AL.5/critical-value-period-interface` | `hypotheses/0`, `statement` |
| `AutomorphicLFunctionsAndLocalFactors:AL.3/global-whittaker-factorization` | `api`, `hypotheses/0`, `hypotheses/1`, `prerequisites/5`, `proofSteps/0`, `proofSteps/1`, `proofSteps/2`, `sources/0/excerpt`, `sources/0/locator`, `sources/0/match`, `sources/0/sourceId`, `sources/1`, `statement` |
| `AutomorphicLFunctionsAndLocalFactors:AL.3/gln-fourier-expansion` | `api`, `hypotheses/0`, `hypotheses/1`, `prerequisites/0`, `prerequisites/1`, `prerequisites/3`, `prerequisites/4`, `proofSteps/0`, `proofSteps/1`, `proofSteps/2`, `sources/0/excerpt`, `sources/0/locator`, `sources/0/match`, `sources/1`, `statement` |
| `AutomorphicLFunctionsAndLocalFactors:AL.3/global-rs-unfolding` | `prerequisites/5` |
| `AutomorphicLFunctionsAndLocalFactors:AL.3/strong-multiplicity-one` | `prerequisites/2`, `proofSteps/2`, `statement` |
| `AutomorphicLFunctionsAndLocalFactors:AL.3/rational-period-comparison` | `hypotheses/0`, `hypotheses/1`, `hypotheses/2`, `prerequisites/2`, `prerequisites/3`, `prerequisites/4`, `prerequisites/5`, `prerequisites/6`, `proofSteps/0`, `proofSteps/1`, `proofSteps/2`, `proofSteps/3` |
| `AutomorphicLFunctionsAndLocalFactors:AL.3/gln-converse-full-rank` | `tests` |
| `AutomorphicLFunctionsAndLocalFactors:AL.3/gln-converse-reduced-rank` | `tests` |
| `AutomorphicLFunctionsAndLocalFactors:AL.3/global-multiplicity-one` | `(new node)` |

Other fields: `requests/12/need`, `requests/23/need`, `requests/23/neededBy/2`, `requests/31`, `requests/32`, `requests/33`, `gaps/11/detail`, `gaps/14/detail`, `restructure/2`.

### GL2AutomorphicRepresentationsAndTransfer--R16.1

| Node | Changed fields |
|---|---|
| `GL2AutomorphicRepresentationsAndTransfer:R16.4/cuspidal-tensor-factorization` | `prerequisites/5`, `proofSteps/1` |
| `GL2AutomorphicRepresentationsAndTransfer:R16.4/global-multiplicity-one` | `prerequisites/4`, `proofSteps/0`, `proofSteps/1`, `proofSteps/2`, `sources/1` |

Other fields: `requests/14/need`, `requests/14/neededBy/6`, `gaps/1/neededBy/18`, `gaps/1/neededBy/19`, `gaps/1/neededBy/20`, `gaps/1/neededBy/21`, `gaps/1/detail`.

### AutomorphicSpectralTheory

| Node | Changed fields |
|---|---|
| `AutomorphicSpectralTheory:AS.1/convergent-intertwiner` | `sources/0/excerpt`, `sources/0/locator`, `sources/0/match` |
| `AutomorphicSpectralTheory:AS.1/pseudo-eisenstein` | `acceptance/1`, `hypotheses/1`, `proofSteps/0`, `statement`, `tests/1/statement`, `tests/2/statement` |
| `AutomorphicSpectralTheory:AS.1/pseudo-eisenstein-l2` | `hypotheses/1`, `statement` |
| `AutomorphicSpectralTheory:AS.1/pseudo-eisenstein-inner-product` | `hypotheses/1`, `statement` |
| `AutomorphicSpectralTheory:AS.6/real-invariant-paley-wiener` | `hypotheses/1`, `prerequisites/1`, `prerequisites/2` |
| `AutomorphicSpectralTheory:AS.6/real-operator-paley-wiener` | `hypotheses/1`, `prerequisites/2`, `prerequisites/3` |
| `AutomorphicSpectralTheory:AS.6/spectral-multiplier` | `api/0/statement` |
| `AutomorphicSpectralTheory:AS.6/weighted-orbital-integral` | `tests/1/statement` |
| `AutomorphicSpectralTheory:AS.0/dit-113` | `prerequisites/5` |
| `AutomorphicSpectralTheory:AS.0/dit-114` | `prerequisites/3`, `proofSteps/0` |

Other fields: `requests/21`, `coverage/0/remaining/12`, `coverage/1/remaining/11`, `coverage/2/remaining/24`, `coverage/6/remaining/15`, `gaps/49`, `gaps/50`, `gaps/51`, `sourceIssues/36`, `restructure/0/proposal`.

### ArithmeticLocallySymmetricSpaces

| Node | Changed fields |
|---|---|
| `ArithmeticLocallySymmetricSpaces:ALS.4/nomizu-van-est` | `hypotheses/0`, `hypotheses/1`, `hypotheses/2`, `hypotheses/3`, `proofSteps/0`, `proofSteps/2`, `sources/0/locator`, `sources/0/match`, `statement` |
| `ArithmeticLocallySymmetricSpaces:ALS.4/boundary-stratum-cohomology-formula` | `hypotheses/0`, `hypotheses/1`, `hypotheses/2`, `hypotheses/3`, `proofSteps/1`, `proofSteps/2`, `sources/0/locator`, `sources/1/locator`, `sources/2/locator`, `statement` |
| `ArithmeticLocallySymmetricSpaces:ALS.4/levi-hochschild-serre` | `sources/1/locator`, `sources/1/match` |

Other fields: `sources/9/edition`, `sources/9/url`, `sources/9/readSections/0`, `sources/9/readSections/1`, `sources/9/readSections/2`, `requests/13/need`.

### AdelicAlgebraicGroups

| Node | Changed fields |
|---|---|
| `AdelicAlgebraicGroups:AA.4/strong-approximation-sufficiency` | `proofSteps/1`, `proofSteps/2`, `proofSteps/3` |
| `AdelicAlgebraicGroups:AA.4/neat-element` | `api/5`, `api/6`, `api/7`, `hypotheses/2` |
| `AdelicAlgebraicGroups:AA.4/neat-representation-independence` | `hypotheses/0`, `hypotheses/1` |

Other fields: `baseline/declarations/93`, `gaps/14/detail`.

### HilbertModularVarietiesAndShimuraCurves--R18.2

| Node | Changed fields |
|---|---|
| `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-class-set` | `hypotheses/1` |
| `HilbertModularVarietiesAndShimuraCurves:R18.3/quaternion-weight` | `hypotheses/1` |
| `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-specialisation` | `hypotheses/1` |
| `HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change` | `hypotheses/1` |
| `HilbertModularVarietiesAndShimuraCurves:R18.3/integral-pairing` | `hypotheses/1` |
| `HilbertModularVarietiesAndShimuraCurves:R18.3/split-hecke-normalisation` | `hypotheses/1` |
| `HilbertModularVarietiesAndShimuraCurves:R18.3/norm-branch` | `hypotheses/1` |
| `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-degeneracy` | `hypotheses/0`, `hypotheses/1`, `hypotheses/2`, `proofSteps/0`, `proofSteps/1`, `proofSteps/2`, `statement` |
| `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-jl` | `hypotheses/1` |
| `HilbertModularVarietiesAndShimuraCurves:R18.3/isotropy-exponent` | `hypotheses/1` |
| `HilbertModularVarietiesAndShimuraCurves:R18.3/base-change-annihilator` | `hypotheses/1` |
| `HilbertModularVarietiesAndShimuraCurves:R18.3/tw-level` | `hypotheses/1` |
| `HilbertModularVarietiesAndShimuraCurves:R18.3/tw-stabilisers` | `hypotheses/1` |
| `HilbertModularVarietiesAndShimuraCurves:R18.3/tw-freeness` | `hypotheses/1` |
| `HilbertModularVarietiesAndShimuraCurves:R18.3/tw-localised-control` | `hypotheses/1`, `proofSteps/0`, `proofSteps/1`, `proofSteps/2` |
| `HilbertModularVarietiesAndShimuraCurves:R18.3/dyadic-norm-twist` | `hypotheses/1` |
| `HilbertModularVarietiesAndShimuraCurves:R18.3/dyadic-hecke-twist` | `hypotheses/1` |
| `HilbertModularVarietiesAndShimuraCurves:R18.3/dyadic-sign-extension` | `hypotheses/1` |
| `HilbertModularVarietiesAndShimuraCurves:R18.3/residual-hecke-ideal` | `hypotheses/1` |

Other fields: `requests/10/neededBy/5`.

### IntegralHeckeAndGaloisDeterminants

No mathematical packet change; review metadata only.

### GrossZagierAndArithmeticHeights--GZ.0

| Node | Changed fields |
|---|---|
| `GrossZagierAndArithmeticHeights:GZ.5/coherent-quaternionic-specialization` | `acceptance/1`, `hypotheses/2`, `proofSteps/2`, `sources/2`, `statement` |
| `GrossZagierAndArithmeticHeights:GZ.5/waldspurger-period-formula-and-its-siegel-weil-proof` | `proofSteps/0`, `sources/3` |

Other fields: `sources/15`, `gaps/9`, `sourceVersions/18`.

### MetaplecticAutomorphicForms--MP.0

| Node | Changed fields |
|---|---|
| `MetaplecticAutomorphicForms:MP.6/second-term-identity` | `hypotheses/0` |
| `MetaplecticAutomorphicForms:MP.6/coherent-incoherent-sections` | `hypotheses/0`, `prerequisites/4`, `prerequisites/5`, `prerequisites/6`, `proofSteps/1` |
| `MetaplecticAutomorphicForms:MP.6/quadratic-quaternionic-norm-instances` | `prototypeBoundary`, `sources/0/locator` |
| `MetaplecticAutomorphicForms:MP.6/toric-theta-pairing-interface` | `hypotheses/0`, `proofSteps/0`, `sources/1` |

Other fields: `sources/0/url`, `sources/25`, `sourceVersions/25`, `sourceVersions/26`, `requests/6/need`, `requests/27`, `requests/28`, `requests/29`, `gaps/60/detail`, `gaps/97/detail`.

### MetaplecticAutomorphicForms--MP.8


Other fields: `restructure/0/roadmaps/2`, `restructure/0/proposal`.

### QSeriesPartitionsAndMockModularForms

| Node | Changed fields |
|---|---|
| `QSeriesPartitionsAndMockModularForms:QM.1/jacobi-rank-one-specialisation` | `statement` |

## Signature-change index

The detailed subject sections explain the retained constructor-based examples and exact omissions. These groups record the source-specific GL₂/transfer declarations removed rather than left as universally false theorems; all named packet targets and test labels are retained in their explicit omission catalogues.

| Targets | Omitted declarations / tests | Required source contract |
|---|---|---|
| `R16.1/local-adelic-compact-comparison`, `R16.1/iwasawa-cartan`, `R16.1/haar-quotient-comparison`, `R16.1/finite-level-comparison` | `compactComparison`, `iwasawaCartan`, `haarComparison`, `finiteLevelComparison` | The AA.0 Haar product, AA.1 adelic group, AA.2 quotient/central-character L² and AL.0 test-function carriers are absent. An arbitrary compact set, measure or vector space cannot satisfy these GL₂ identifications. |
| `R16.4/cuspidal-tensor-factorization`, `R16.4/global-whittaker-expansion`, `R16.4/global-multiplicity-one`, `R16.4/strong-multiplicity-one`, `R16.4/cohomological-rationality` | `cuspidalTensor`, `globalWhittakerExpansion`, `globalMultiplicityOne`, `strongMultiplicityOne`, `cohomologicalRationality` | Use AL.3 Fourier reconstruction, global-whittaker-factorization and global-multiplicity-one, then AL.3 strong-multiplicity-one. The source π, its cusp embedding, its actual local components and its rational model are indispensable. The old statements quantified over unrelated functions and multiplicities. |
| `R16.5/whittaker-integral-comparison`, `R16.5/full-gl2-converse`, `R16.5/classical-l-function-comparison` | `whittakerIntegral`, `gl2Converse`, `classicalLFunction` | The actual Rankin–Selberg integrals and completed L-functions are unavailable. The GL₂ converse needs every Hecke-quasicharacter twist, generic local factors/Casselman–Wallach globalizations, central-character automorphy, Euler convergence, dual entireness, strip bounds and the epsilon functional equations. AL.3/gln-converse-full-rank is used at n=2; reduced rank gives no n=2 theorem. |
| `R16.6/primitive-classical-bijection` | `primitiveBijection`, `primitiveBijection_conductor`, `primitiveBijection_weight_character`, `primitiveBijection_hecke`, `primitiveBijection_normalized`, `primitiveBijection_inverse`; source-level tests omitted: `TauCeti.GL2Blueprint.primitiveBijection_weight_two` | The primitive exact-conductor newform subtype and actual AF.5 adelization map with fixed k, nebentypus, infinity type and coefficient projections must exist before these equivalences and their API can be stated. No equivalence of two arbitrary types is asserted. The sound old-level/scalar tests below remain concrete fragments. |
| `R16.6/geometry-and-galois-exports` | `geometricExports` | The designated characteristic-zero automorphic multiplicity space at its compatible level/infinite type must be identified first. An arbitrary vector space does not have dimension one; integral/torsion multiplicity is separate. |
| `R16.6/weight-one-classical-comparison` | `weightOneClassicalComparison` | The actual conductor-N weight-one primitive newforms and full-O(2) limit D₁(0) automorphic subtype, odd nebentypus and lowering-operator condition are unavailable. Weight one has parameter 1⊕sgn and is not a negative symmetric-power coefficient system. |
| `R17.3/global-jl` | `globalJL`, `globalJL_local`, `globalJL_central`, `globalJL_inverse`, `globalJL_twist`, `globalJL_split`; source-level tests omitted: `TauCeti.GL2Transfer.jl_split_test`, `TauCeti.GL2Transfer.jl_steinberg_test`, `TauCeti.GL2Transfer.jl_eisenstein_excluded_test`, `TauCeti.GL2Transfer.jl_inverse_test` | Global JL is an equivalence only between the supplied non-norm quaternionic discrete spectrum and the D-compatible cuspidal GL₂ spectrum over the same number field and central character. All actual local JL, Hecke, twisting and inverse maps are required; an arbitrary pair of types need not be equivalent. |
| `R17.4/adjoint-lift` | `adjointLift`, `adjointLift_local`, `adjointLift_unramified`, `adjointLift_twist`, `adjointLift_central`; full automorphic test assertions omitted, **matrix-component tests retained:** `TauCeti.GL2Transfer.adjoint_diagonal_test`, `TauCeti.GL2Transfer.adjoint_scalar_test`, `TauCeti.GL2Transfer.adjoint_twist_test`, `TauCeti.GL2Transfer.adjoint_not_sym_square_test` | The Gelbart–Jacquet construction needs the genuine unitary cuspidal GL₂ and isobaric GL₃ carriers, all-place local factors/LLC and the distinct highly ramified T-converse input. The matrix component below does not construct an automorphic lift. |
| `R17.4/nonnormal-cubic-base-change` | `cubicBaseChange`, `cubicBaseChange_unramified`, `cubicBaseChange_twist`, `cubicBaseChange_central`, `cubicBaseChange_unique`; source-level tests omitted: `TauCeti.GL2Transfer.cubic_split_test`, `TauCeti.GL2Transfer.cubic_one_two_test`, `TauCeti.GL2Transfer.cubic_inert_test`, `TauCeti.GL2Transfer.cubic_not_three_test` | Non-normal cubic base change requires an actual separable cubic number-field extension, its places/residue degrees, the weak JPSS automorphic transfer and isobaric uniqueness. Its original construction and the stronger Carayol all-place upgrade remain separate source-proof gaps. No arbitrary function between carriers is a transfer. |
| `R17.3/norm-exception`, `R17.3/split-hecke`, `R17.3/local-factors`, `R17.3/strong-multiplicity-one`, `R17.3/multiplicity-one`, `R17.3/coefficient-conjugation`, `R17.3/rational-models`, `R17.3/definite-infinity`, `R17.3/indefinite-parity`, `R17.3/invariant-exchange`, `R17.3/supercuspidal-globalization` | `norm_exception`, `split_hecke`, `local_factors`, `strong_multiplicity_one`, `multiplicity_one`, `coefficient_conjugation`, `rational_models`, `definite_infinity`, `invariant_exchange`, `supercuspidal_globalization`; **retained numeric fragment:** `indefinite_parity` | The non-norm JL domain, eligible cuspidal range, actual Hecke/local-factor maps, compatible rational models and prescribed infinity/globalization hypotheses are required. Equality of rationality fields does not itself provide those models. |
| `R17.4/cubic-character-induction` | `cubic_character_induction` | Cubic induction requires a cyclic degree-three number-field extension and its continuous Hecke-character carrier, actual Weil induction and local-factor maps. The non-invariant orbit is the cuspidal branch; an invariant character gives the three rank-one summands. |
| `R17.5/dihedral-artin`, `R17.5/tetrahedral-artin`, `R17.5/octahedral-artin`, `R17.5/solvable-artin` | `dihedral_artin`, `tetrahedral_artin`, `octahedral_artin`, `solvable_artin` | The continuous finite-image irreducible Galois representation, actual projective-image classification, local Weil data and automorphic parameter maps must be typed. The dihedral/tetrahedral/octahedral/solvable source hypotheses cannot be discarded from the existential automorphy statement. |
| `R17.5/q-weight-one`, `R17.5/tr-weight-one`, `R17.5/residual-lt-application` | `q_weight_one`, `tr_weight_one`, `residual_lt_application` | Use the actual G_Q or totally-real G_F, finite-image irreducible odd representation, its solvable image and the genuine weight-one classical/adelic dictionary. Conductor, nebentypus and all-place infinity-type hypotheses remain. The totally real extension is still requested from R16.6. |

Additional signature edits: AS replaces the initial convergence/pseudo-Eisenstein, arbitrary local-meromorphy, real-PW, multiplier, μ and weighted-splitting claims with the precise omissions/adapters documented above; its tests now call the actual torus, shell-integral, scalar-composition, weight and multiplier definitions. AF adds the rational level-restriction and discriminating base-change fragments. AA uses actual algebraic-point-map hypotheses and omits the invalid strong-approximation stand-in. ALS synchronizes the relevant omission catalogue with its corrected source statements. R18 corrects the central-character parameter and residual-to-integral boundary comment. MP.0 corrects the norm-range hypotheses and owner/proof comments; GZ and QM correct their source-boundary comments. IHG and MP.8 suggested files are unchanged.


## Final validation and limits

All thirteen packet checker invocations pass with **zero errors and zero per-packet warnings**. The checker reports the absence of a local declaration index; its baseline reference check is therefore syntactic. The source-level pinned checks listed above and in the subject sections supply the stated independent evidence, not an invented complete declaration index. The API/test columns use the checker's definition/construction counts; extra theorem API and acceptance-test fields are not included in those two counts.

| Packet | Nodes | Baseline entries | API items | Mathematical tests | Planets | Requests | Gaps |
|---|---:|---:|---:|---:|---:|---:|---:|
| `GL2AutomorphicRepresentationsAndTransfer--R17.3` | 57 | 8 | 33 | 29 | 20 | 35 | 8 |
| `AutomorphicFormsOnReductiveGroups` | 90 | 36 | 237 | 167 | 30 | 40 | 22 |
| `AutomorphicLFunctionsAndLocalFactors` | 123 | 68 | 137 | 118 | 29 | 34 | 16 |
| `GL2AutomorphicRepresentationsAndTransfer--R16.1` | 55 | 17 | 48 | 37 | 42 | 32 | 8 |
| `AutomorphicSpectralTheory` | 190 | 24 | 223 | 219 | 38 | 22 | 52 |
| `ArithmeticLocallySymmetricSpaces` | 66 | 36 | 132 | 88 | 31 | 19 | 16 |
| `AdelicAlgebraicGroups` | 204 | 94 | 223 | 144 | 25 | 21 | 20 |
| `HilbertModularVarietiesAndShimuraCurves--R18.2` | 58 | 16 | 65 | 49 | 21 | 38 | 6 |
| `IntegralHeckeAndGaloisDeterminants` | 253 | 67 | 228 | 207 | 33 | 19 | 38 |
| `GrossZagierAndArithmeticHeights--GZ.0` | 241 | 44 | 267 | 197 | 33 | 65 | 10 |
| `MetaplecticAutomorphicForms--MP.0` | 176 | 58 | 181 | 180 | 42 | 30 | 105 |
| `MetaplecticAutomorphicForms--MP.8` | 85 | 28 | 107 | 104 | 6 | 15 | 9 |
| `QSeriesPartitionsAndMockModularForms` | 537 | 418 | 772 | 514 | 42 | 25 | 22 |

The `errata-v1` projections of every packet's source issues and version records also pass their checker. The projections are validation inputs only. No source PDFs, scratch files or checker changes are submitted. Source-issue success checks the record structure; it is not a claim that every inherited published-paper finding was freshly adjudicated.

JSON validity, unique/stable existing node identifiers, the one new AL node, unchanged existing implementation statuses, review-history preservation, valid scoped supplier references and the deliverable allowlist were checked. Static inspection of the changed Lean regions found no unmatched comment/scope or stale executable references to the deliberately omitted transfer declarations. The small AS replacements were independently reviewed once more for their literal assumptions: the geometric-series shell sum, Fourier sign/measure, scalar μ inversion, rank-one germ, positive Haar rescaling and image-preserving multiplier transport are mathematically coherent. These are source/static checks, not executed proof tests.

No link map or standalone restructuring proposal is under review; the packet checker validates the edited embedded proposal fields. The precise I/J/MW node closures are independent of QM.1, but no claim is made that the coarse atlas graph or every theta/K-function cycle is resolved. The fresh-base comparison preserves the concurrent ALS revision and all unrelated main changes.

**Lean was not compiled.** No usable prebuilt environment at both pins was available; none was created or downloaded. Historical successful compilation in an archived review remains historical. No stage is declared implemented or closed by this review.

## Handoff

`research/blueprint/handoff/REV-FIX-RT-AREA-automorphic-1~3.md` gives the completed outcome and exact remaining work. Reader synchronization requires a job that authorizes those paths. CC/NE/TC/R31 and p-adic consumer changes remain with their named owner jobs. No atlas promotion, upstream edit, manual merge, issue closure or label change is performed by this worker.
