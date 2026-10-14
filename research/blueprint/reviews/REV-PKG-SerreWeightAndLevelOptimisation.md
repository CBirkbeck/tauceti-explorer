# Independent package review: SerreWeightAndLevelOptimisation

**Verdict: accepted with the corrections below.** Codex, session
`codex-MF3ror`, reviewed issue #9781 on 2026-10-14. This is an independent
review of the package submitted for #9780, not a review of this agent's work.
The roadmap is ready for its draft PR as a mathematical plan with explicit
supplier extensions and the inherited Diamond proof-access gap. Acceptance
does not say that these targets, or those extensions, are formalised.

## Shape and completeness

Read WORKERS.md, PROTOCOL.md, PACKAGE_REVIEW.md, UPSTREAM_GUIDE.md and the
expansion protocol. Compared the README and Suggested.lean with the current
ModularForms and LocalGaloisGroups roadmaps. The package preserves the
introduction, ownership boundaries, conventions, exact supplier contracts,
six layers, proof routes, definition APIs, Checks, worked examples and
downstream manifest. All 62 accepted-packet target anchors remain, in layer
counts 4, 13, 14, 8, 11 and 12. The six definitions retain their 58 named API
items and 21 named tests; no mathematical target was dropped to shorten the
file. Definitions that require absent geometric carriers stay in the README.
The 128-line Suggested.lean contains two light definitions with real bodies,
eight theorem signatures and four examples. It develops no auxiliary theory.
metadata.toml remains `topic = "math.NT"`.

The source descriptions and statements use the package author's own words.
The corrections below also use our own words. No source excerpts, acquired
paper files or restricted library material were added to the repository.

## Corrections made

1. Corrected five locators: Ribet's conductor definition is in §2, author
   p. 4, with divisibility in Theorem 4.2, pp. 8–9; the localized sequences
   (7.2)–(7.3) are on author p. 24; small-weight twisting is **Corollary 3.2**;
   the character-replacement result is **Theorem 1.3**; Wiese's full
   conditional theorem is **Theorem 10**, without a part (a).
2. Corrected the ModularForms layer 3 contract. Its global old/new theory
   does not explicitly supply the relative q-new comparison at a single
   added prime. Target 2.2 now owns that comparison using the pairing and
   degeneracies. Target 4.6 owns the precise mixed-level trace formula.
3. Corrected the layer 0 contract. Eisenstein-series construction and
   generalized-Bernoulli formulas do not themselves supply the special
   residual valuations. Targets 4.4 and 4.6 now own those arithmetic
   arguments. Choose the Teichmüller exponent i≥3 in its residue class,
   retain the imprimitive Euler factor, and justify the nonzero constant
   before division. Added the ℓ=3, i=4 check.
4. Corrected the layer 2 contract. Same-level U_ℓ coefficient extraction is
   insufficient for a decrease of Γ0 depth. Target 4.5 now proves that
   transformation property from the correspondence.
5. Corrected the layer 6 contract. Target 4.6 now compares the partial
   Atkin–Lehner normalization to Ribet's matrix, proves the displayed trace,
   square and V formulas, and normalizes v_ℓ(ℓ)=1 even over a ramified
   coefficient DVR. Added the E₄, ℓ=5 sign and valuation computation.
6. Corrected the layer 8G contract. The supplier states coefficient-Galois
   stability for normalized newforms. Target 4.5 extends it to the actual
   algebraic cusp form by its newform/degeneracy expansion, with independence
   established by q-expansion injectivity. It retains a Frobenius lift in
   the designated coefficient-prime decomposition group.
7. Made the inherited Diamond source-access gap explicit in the boundaries.
   The exact conditional statement is publicly sourced; its complete
   primary proof was not independently acquired. No assertion was made
   that Ribet's trivial-character argument closes that gap.

## Source checks

Sampled 15 target nodes without replacement, using Python's seeded random
generator with seed 9781 on the accepted packet's node order. Read the
referenced public sources and checked the statements, numbering and printed
pagination. The table records the selected nodes, not just nearby sources.

| Target | Source locations read | Result |
| --- | --- | --- |
| 1.4 Residual support and eigenvalue descent | Ribet–Stein §3.6, pp. 39–40; Ribet §§5, 7, pp. 13–16, 22–27 | Quotient factorisation precedes eigenvalue lifting; support is tested on the residue module. |
| 4.3 First character normalization | Ribet Theorem 2.1, Step 1, p. 5 | Odd-primary square root, residually trivial twist and possible level increase agree. |
| 3.6 Companion criterion for ordinary splitting | Gross Proposition 13.8, pp. 497–498; BCG proof of Theorem 2.4, p. 515 | One-way splitting conclusion has k<p; the weight-26/82 example lies in that range. |
| 2.8 Monodromy comparison | Ribet §6, pp. 19–21, §7 (7.6)–(7.10), pp. 24–27 | Integral component groups and odd-characteristic dimension arguments retained. |
| 4.1 Congruent nebentypus | Ribet Theorem 1.3, pp. 2–3; Gross Proposition 9.3 and remarks, pp. 478–479 | Named Ribet's theorem precisely; ℓ≥5 and the low-characteristic obstruction agree. |
| 5.1 Buzzard multiplicity one | Buzzard Definitions 2.1–2.2, Lemma 2.3, Proposition 2.4, pp. 100–101 | Universal levels, full Picard Hecke ring and finite/nonfinite parity agree. |
| 6.2 Weight-two newform at reduced level | Bennett–Siksek Theorem 3, p. 359 | Conditional elliptic newform statement and its residual irreducibility hypothesis agree. |
| 2.5 Degeneracy matrix and η | Ribet Theorem 6.1, pp. 17–18, §5 pp. 13–15 | Picard matrix, contravariant transpose and general-weight diamond factor agree. |
| 2.7 Ribet exact sequences | Ribet (6.2)–(6.3), pp. 18–19; (7.2)–(7.3), p. 24 | Corrected the second page locator; opposite-prime Y labels and localization order agree. |
| 2.6 Bad-fibre character groups | Ribet §6, pp. 18–19 | The named torus lattices and contravariant map direction agree. |
| 3.8 Twisting to small weight | Ribet Corollary 3.2, p. 8 | Corrected Lemma to Corollary; twist rather than original weight is optimized. |
| 4.5 Reducing coefficient-prime depth | Ribet Theorem 2.1, Step 3, p. 5 | Correct inverse coefficient Frobenius and r>1 boundary; filled the supplier-contract distinctions above. |
| 3.12 Scalar multiplicity lower bound | Wiese Situations I/II, p. 69, Corollary 2.3, pp. 71–72, Theorem 3.1, pp. 72–75, Corollaries 4.2/4.5, pp. 77–79; CG Remark 4.9 | Correct full/anemic distinction, Frobenius direction and dyadic weight-one-witness requirement. No exact upper bound is imported into R20. |
| 2.1 Serre level | Ribet §2, p. 4, Theorem 4.2, pp. 8–9 | Replaced the determinant-equation locator with the conductor formula and divisibility theorem. |
| 6.8 Parallel p+1 change | KWII Lemma 8.3, pp. 73–74 | Product over all residue embeddings and determinant normalization retained. |

Also read the consequential boundary sources: Edixhoven's author revision
Theorems 2.5–2.8 and Remark 4.4/Theorem 4.5, author pp. 5–7, 10–12;
Coleman–Voloch Theorem 0.1/Corollary 0.2, author pp. 1–3; Gross Proposition
8.18, p. 477; CG20 Lemma 8.14, printed pp. 865–866; KWII §8, pp. 70–78;
KWI Lemma 6.2, p. 11; Kisin §3.1 and Corollary 3.1.11, pp. 1145–1152;
IKM Proposition 2.10, p. 786; Wiese04 Theorems 9–10, pp. 130–132. These
checks preserved the package's previous corrections, including the
V-scalar α⁻¹, the p+1 boundary and the simultaneous KW type choice.

All sixteen public source families were accessed. Edixhoven was read via
the same author's PostScript companion to the cited DVI, rendered in
scratch. Buzzard's current publisher PDF includes a changing download
stamp; its pagination and mathematical content agree. No hash equality
with the packet is asserted for that stamped file.

**Remaining access limitation:** Diamond, *The refined conjecture of Serre*
(1995), Theorem 1.1, proceedings pp. 22–37. Wiese04 Theorem 10 and proof,
pp. 131–132, independently establish the conditional theorem statement and
identify that input. Public-source searches did not establish an accessible
complete primary proof, and the maintainer's library index does not clear
those proceedings. No uncleared copy was used. The limitation is inherited
from the accepted packet and affects the proof routes for 2.13 and its
conductor-level consumers 3.13, 4.8 and 6.4. It is recorded in the README,
rather than hidden by this verdict. The separately sourced trivial-character
core and the public conditional statement remain distinguishable.

## Library, ownership and prerequisite audit

Read the reviewed coverage data and the accepted packet's library audit;
there is no claim here of an audited negative implementation result for
R20. Read the eleven advertised baseline declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`:

| Baseline | Contract checked |
| --- | --- |
| cuspFormsOld, cuspFormsNew, isCompl_cuspFormsOld_cuspFormsNew | Complex global old/new subspaces and Petersson complement; no integral saturation. |
| ModularForm.levelRaise | Nonzero d, subgroup inclusion and target HasDetOne; evaluation at dτ. |
| HeckeRing.GL2.Newform, cuspFormsNewEigenspace | Normalization and good-index eigenform data; no bad-prime U slot or residual multiplicity. |
| DirichletCharacter, changeLevel | MulChar on ZMod; divisibility for pullback, nonzero destination for injectivity. |
| Submodule.mkQ | Existing linear quotient projection and module carrier. |
| Nat.primeFactors, padicValNat | Distinct prime factors and exponent valuation, with nonzero/prime hypotheses where interpreted arithmetically. |

Compared every retained target's mathematical objects against current
roadmaps at `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti
at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searched carriers, operator
formulas and hypotheses, including integral degeneracy quotients, residual
Hecke support, ramification exponents, ordinary extensions, companion
weights, Hasse projectors, Jacobian residue multiplicities and definite
quaternionic raising. Read the relevant ModularForms layers 0, 2–6, 8, 8W
and 8G and their Suggested.lean, LocalGaloisGroups, EllipticCurves, and
IntegralHeckeAndGaloisDeterminants. Checked the nine newer roadmap families,
including OperatorTheory's subroadmaps, and all four specified Completed
roadmaps. No R20 target was found already supplied in its retained residual
or arithmetic form; **no removals** resulted.

The current library's
`TauCeti.exists_cuspForm_mem_cuspFormCharSpace_or_eq_zero` in
`NumberTheory/ModularForms/ConductorDichotomy.lean` is descent of an actual
periodic analytic form with character factorisation. It does not prove the
residual support/exponent statements here. Current newform multiplicity
one is a characteristic-zero complex eigenspace result, not Buzzard's
Jacobian torsion condition. IntegralHeckeAndGaloisDeterminants supplies
reducibility/congruence-ideal comparisons, but not the augmented Ψ functor
promised as an explicit extension in this package.

Walked all target prerequisites and the supplier list against
upstream/CaraianiNewton.md. R20 is tier 19; its suppliers are lower-tier
roadmaps or existing Tau Ceti work. The R27 and R29 references are downstream
manifest/consumer references, not proof inputs. No FoundationsAndLibraryIntegration
or UPSTREAM placeholder survives. The layer order describes a dependency
graph: the early weight theorem may use Layer 4, and the scalar dyadic
boundary may use independent 6.5. Neither uses the final Serre theorem.
The existing 37 extension requests remain explicit contracts, not claims
that the lower roadmap already supplies the stronger theorem. The five
newly clarified ModularForms applications are owned by named targets here.

## Adversarial mathematics pass

The following table records a pass through **every one of the 62 targets**.
The ring conventions were also checked separately: quotient algebra may
use arbitrary commutative rings, whereas lattice finiteness needs a DVR;
geometric p-adic statements use their supplied mixed-characteristic
coefficient setup. Equal-characteristic k[[π]] does not acquire those
geometric conclusions. A field is not silently treated as a coefficient
DVR with nonzero uniformiser. Every denominator below has either a unit,
a nonzero constant, or the specified fraction-field interpretation.

| Target | Instances or failure tested | Outcome |
| --- | --- | --- |
| 1.1 | Zero localized module; unsaturated degeneracy image | Free cokernel requires the explicit Ihara/saturation contract. |
| 1.2 | Coordinate lines; lines (1,0),(1,π); repeated line; zero module | Quotients 0, O/(π), O, 0 respectively; torsion requires rational complement. |
| 1.3 | Impossible unit kernel; torsion M; A={(a,b):a≡b mod π} | Torsion-free quotient is essential; no automatic equality with lattice gluing. |
| 1.4 | L=0; I not killed; multiple lifts | No existence from zero support or failed factorisation; no uniqueness asserted. |
| 2.1 | Tame invariant dimensions 0/1/2; positive Swan term | Full exponents retained; corrected source location. |
| 2.2 | M with another old prime; quotient with zero residue support | Relative q-new may remain old elsewhere; added owned comparison. |
| 2.3 | ℓ=5, diag(1,4); ℓ=2; match ρ alone | Joint quotient and oddness essential; trace 0, determinant 4 in the witness. |
| 2.4 | q≡−1; repeated roots q≡1; ℓ=2 | Correct trace-square criterion; odd-characteristic coefficient range retained. |
| 2.5 | Two coordinate vectors; nontrivial diamond character | Columns (T_q,−1),(q,0), determinant q; transpose and diamond factor retained. |
| 2.6 | Swap p/q; p=q; p dividing M | Correct variance and opposite-prime labels; bad inputs excluded. |
| 2.7 | Residue reduction with nonzero Tor; swapped sequences | Localize before reduction; corrected page, no unjustified left exactness. |
| 2.8 | Finite-index inclusion; ℓ=2 | Integral component torsion retained; odd-prime inequality not exported dyadically. |
| 2.9 | q≡1 mod ℓ; ramified residual representation | Mazur hypotheses exclude these apparent shortcuts. |
| 2.10 | ℓ divides pre-existing level; ramified removed prime | Weight-two trivial-character branch and q≠ℓ retained. |
| 2.11 | Residually trivial ramified twist; coefficient-prime twist | Characteristic-zero conductor may change; global twist constraints retained. |
| 2.12 | Equal residual principal-series characters; wild exponent | Residual conductor defect is not a radical-level test. |
| 2.13 | q³ with residual exponent two; ℓ=3 | Output q²; full proof input and character restriction explicitly marked. |
| 3.1 | a_p=0; ordinary upper-right extension | Ordinarity permits inversion; actual local extension retained. |
| 3.2 | p=2; endpoint small weight | Supersingular range and fundamental-character normalization retained. |
| 3.3 | Peu versus très ramifiée; Hasse weight p+1 | Actual extension-sensitive finite-flat branch distinguished. |
| 3.4 | Nonliftable Katz weight one; p=2 | Odd-characteristic unramifiedness uses Katz witness; dyadic qualification retained. |
| 3.5 | k=2; k=p with equal roots; p=2 | Coleman–Voloch range 2<k≤p retained; tame need not mean split at k=p. |
| 3.6 | Weight 26 at 107; k=p self-extension | Companion weight 82 works; stronger split conclusion excludes k=p. |
| 3.7 | Scalar versus Jordan; classical versus least Katz weight | Extension and differing weight conventions are explicit. |
| 3.8 | Nontrivial cyclotomic twist | Small weight belongs to the twist; corrected Corollary locator. |
| 3.9 | ℓ=3 fixed-character obstruction; twist changing depth | Four sets equated only in their stated range. |
| 3.10 | Non-Gorenstein Hecke factor; p=2 | Connected rank one does not make the Z_p-dual free over Hecke; p≥3 retained. |
| 3.11 | Nontrivial Jordan with equal eigenvalues | Nonscalar condition is a matrix condition, not distinct-root condition. |
| 3.12 | Scalar Frobenius; p=2 without weight-one witness | Lower bound only with its supplied witness/situation; no exact-two upper bound. |
| 3.13 | O-torsion coherent algebra; multiple T_p roots; small N | Away-p ideal need not be flat; root choice and stack descent separate. |
| 3.14 | α=0; α=β; α=2, β=3 in F₇; large ramified torsion power | Existing checks correctly give V scalar 4; whole-module nilpotence and sufficient Hasse power required. |
| 4.1 | ℓ=3 level 13; incompatible parity | ℓ≥5 and fixed parity retained; corrected theorem number. |
| 4.2 | Already tame level; ℓ=2 | Depth-zero case harmless; odd and dyadic proofs remain separate. |
| 4.3 | Odd-primary square root; 2-primary character | Squaring inverse exists only in stated odd-primary branch; twist can increase depth. |
| 4.4 | ℓ=3, i=4, trivial imprimitive character | c=−13/120 has negative 3-valuation; Euler factor and owned valuation proof added. |
| 4.5 | r=1; non-prime-field coefficients; newform versus arbitrary f | r>1 and inverse Frobenius essential; two missing analytic applications now owned. |
| 4.6 | ℓ=5, E₄; ramified DVR; too-small i | Coefficients 240 and −6000 have valuations 1 and 3; normalization and trace proof added. |
| 4.7 | k=2; genuine versus Hasse p+1; ℓ=N=3 | Occurrence not exact newness; small-level and character qualifications retained. |
| 4.8 | Nonfinite boundary; ℓ=3; prescribed tame character | Finite-flat hypothesis and separate full-level input retained. |
| 5.1 | One copy/two copies; one tested level; wrong level parity | Dimensions two/four discriminate; universal condition is not reduced to one pair. |
| 5.2 | Nonsplit unramified Jordan; scalar local restriction | First is included, second excluded; whole local representation used. |
| 5.3 | Q(i)-induced; trace zero at auxiliary q | Dedicated exceptional branch retained; auxiliary trace must be nonzero. |
| 5.4 | 2-power characters with trivial reduction | Character replacement retains dyadic induced exception and parity. |
| 5.5 | Involution at r; arbitrary auxiliary prime; bad a₂ | Involution raising and a₂ preservation explicit, not distinct-root raising. |
| 5.6 | Ramified removed q; false-point component terms | Unramifiedness, multiplicity and geometry retained. |
| 5.7 | Finite-flat/nonfinite at two | Weight-two versus weight-three bridge; classical even-weight interpretation separate. |
| 5.8 | Multiple conductor exponents; scalar non-dihedral case | Decrease of excess exponents uses only applicable lowering branch. |
| 5.9 | Q(i)-induced; general scalar case | Separate induced proof; no blanket nonscalar theorem applied to scalar case. |
| 5.10 | Dihedral projective image; scalar local restriction | Existing R17.6 owner imported; application does not rebuild induction. |
| 5.11 | Scalar local versus scalar semisimplification | Actual scalar branch and weight-one-existence limitation retained. |
| 6.1 | M=1/0; Δ sign; M=33,ℓ=3; exponent-two prime in 45 | Arithmetic defaults distinct from elliptic hypotheses; reduced levels 11 and 9 agree. |
| 6.2 | ℓ=3; reducible E[ℓ]; coefficient prime removed | Conditional irreducible elliptic branch and special finite-flat input retained. |
| 6.3 | Good prime; removed multiplicative prime; q=ℓ; additive reduction | Actual residue field and trace signs retained; coefficient-prime and additive cases excluded. |
| 6.4 | Small/bad coefficient prime; no irreducibility premise | Large-good-prime export consumes explicit eventual irreducibility and full descent. |
| 6.5 | Scalar odd-order local character at two | Inertia killed; finite étale model gives finite flat; nontrivial scalar allowed. |
| 6.6 | Identity change; p=2 weight four; γ versus −γ | Identity transport is not allowable even-degree extension; actual square root retained. |
| 6.7 | α versus β initial witness; Σ containing p; dyadic stabilizers | Joint witness/Σ/determinant alternatives retained; p-parts enlarged beyond stabilizer bound. |
| 6.8 | Residue degree f=2; p=2 | Tensor dimension p², not p; p>2 required. |
| 6.9 | S_m=0; singular Gram alone; p=2/q dividing p | Nonzero support, full-module defect and integral pairing required; separate KW branch. |
| 6.10 | Empty/even set; odd discriminant set; quadratic sign twists | Parity, auxiliary-place removal and disjointness preserved; final sign-killing change retained. |
| 6.11 | Mixed A/B/C; inadmissible p+1; fixed determinant with wrong γ | Simultaneous admissible type and chosen roots required; no arbitrary original-field lift. |
| 6.12 | All seven characteristic/image branches | Final scalar completion and unconditional modularity remain downstream manifest only. |

## Definition tests and Lean signatures

| Definition | Three or more discriminating checks retained |
| --- | --- |
| levelChangeGluing | Coordinate split zero; saturated index-π quotient; repeated line gives nontorsion quotient. |
| complexConjugationAuxiliaryPrime | Joint F₅ class; bad prime rejected; matching ρ alone fails to guarantee cyclotomic residue. |
| minimalWeightOneIdeal | Wrong good-prime trace rejected; incompatible diamond rejected; distinct T_p roots contract to one away-p ideal. |
| buzzardMultiplicityOne | One versus two copies; finite-flat level parity; universal quantification over distinct pairs. |
| reducedLevel | Coefficient-prime removal at 33; retained higher exponent at 45; no removal when valuation fails; Δ sign invariance. |
| kwOptimisationData | Weight-two determinant choices coincide; residual-image shrinking rejected; dyadic weight-four/special branch; wrong root square rejected. |

Spot-checked all twelve theorem/example signatures against the README,
exceeding the ten-signature requirement: gluing zero iff span, class zero
iff membership, unique factorisation, transport, both lattice examples,
reduced-level divisibility, positivity, prime-removal iff, retained higher
exponent, and both reduced-level examples. General quotient statements use
the existing arbitrary-ring/module carrier; none asserts DVR torsion there.
The arithmetic signatures explicitly add positive M and prime q for the
prime-removal facts, while the elliptic interpretation additionally requires
a nonzero minimal discriminant and a conductor. The four other definition
names appear in the closing comment and retain their full intended APIs in
the README. No `True`, sorry'd data carrier or conclusion-as-hypothesis
signature occurs. The new analytic normalization controls cannot be typed
without the unavailable geometric/series interfaces, so remain README
Checks rather than fabricated Lean carriers.

Ran `lean-check` on this package's absolute Suggested.lean path after
checking available memory. It exited **0**, with exactly twelve
`declaration uses 'sorry'` warnings and no other warnings or errors. The
file was not changed afterward. This checks elaboration, not proof truth.
No language server, lake build, update or cache download was started.

## Validation and remaining work

`scripts/check_blueprint.py` on the unchanged input packet passed with zero
errors and zero warnings (62 nodes, one recorded gap, 37 requests).
`intake.py check-files` and `git diff --check` passed for the submission.
The package files, review record, this report and the review handoff are
the only changed paths.

No uncorrected mathematical defect was identified. The remaining Diamond
proof access and the named lower-tier supplier extensions are obligations
already exposed by the plan, not library implementation claims. Carry the
five locator corrections and the clarified ModularForms application
ownership into any later reconciliation of the older packet/reader; this
review did not edit them. No higher-tier target was moved and no existing
Tau Ceti target was re-planned.
