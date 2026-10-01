# RT-PAPER-CAI-FRIEDBERG-KAPLAN-24

Red team of the accepted extraction PAPER-CAI-FRIEDBERG-KAPLAN-24: Yuanqing Cai, Solomon Friedberg and Eyal Kaplan,
*Doubling constructions: global functoriality for non-generic cuspidal representations*, Annals of Mathematics 200
(2024), 893–966 (arXiv 1802.02637v5). Issue #4056.

Red team: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write or review:
- the extraction (`cc-442dc5`, PRs #2148 and #2149);
- its review, REV-PAPER-CAI-FRIEDBERG-KAPLAN-24 (`cc-39fac3`, PR #2358).

Disclosures:
- my FIX-RT-PAPER-GAN-ICHINO-18 (PR #5231) added PAPER-GAN-ICHINO-18 route 8, which /2 quotes. /2 rests on
  PAPER-GAN-SAVIN-23 route 3 and on the independent verdict confirming RT-PAPER-GAN-ICHINO-18/6, neither of which I
  wrote;
- I wrote REV-RT-PAPER-ATOBE-KONDO-YASUDA-22. /7 cites that paper's accepted route 2, which I did not write;
- I marked PAPER-LE-LEHUNG-LEVIN-ETAL-23 complete (PR #4894). /21 cites its item A70 as a second planner.

**Result: 42 findings, 3 high, 19 medium and 20 low.**

## Method

**The source.** arXiv 1802.02637v5 (<https://arxiv.org/abs/1802.02637v5>), the version the extraction read, was
re-downloaded on 2026-10-01 with its LaTeX source. Its SHA-256 is `dd49d944…0f16ef`, equal to the extraction's. The
published Annals text is paywalled and was not read.

**The passes.** Five parallel passes were run by this session.
- Four read all 60 pages against the extraction: Introduction and §§1–3.5, §3.6, §4, and Appendix A with the references.
- One checked the route, the four planned statuses, every missing status and the brief against the atlas, other papers'
  accepted routes (including the three other Part II proposals that make_queue merges with route 1), earlier red teams
  and the pinned libraries (Mathlib 082e2d3, Tau Ceti f790474).

**Merging.** I merged findings reported by more than one pass:
- the Eisenstein-series ownership; the Langlands classification with the archimedean parametrisation;
- Dixmier–Malliavin, Jacquet–Shalika and the generic unitary dual; the rs-factors status; the missing prerequisites
  list;
- the Speh constructor; the ET.7a import; the global Rankin–Selberg poles; the brief's statement of the final theorems;
- the review-added items missing from the dependency graph; the report's counts; the wrong locators.

**What I re-verified myself.** All three high findings:
- AS.1 and AS.2 plan Eisenstein convergence, constant terms, intertwiners, continuation and regularity on the unitary
  axis, and PAPER-EISCHEN-HARRIS-LI-ETAL-20 route 1, with the same Part II id, imports them;
- the brief both imports Langlands quotients from SmoothRepresentationsOfLocalGroups and calls the classification
  "planned nowhere"; PAPER-GAN-SAVIN-23 route 3 (accepted) routes it to SR.3, and the verdict on
  RT-PAPER-GAN-ICHINO-18/6 tells this Part II to import it;
- Dixmier–Malliavin is at AF.1 by two accepted routes, Jacquet–Shalika at AL.3 by five, and the generic unitary dual at
  ET.6 (Tadić) and AF.1 (Vogan).

**Severities.** I changed none. Every pass reported its findings at the severities above; merged findings take the
highest severity of their parts.

The full list of what was checked is in the result's `checked` field.

## The high findings

### /1 — duplicate

**Where.** route 1 brief; PAPER-CAI-FRIEDBERG-KAPLAN-24/eisenstein-series,
PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-holomorphy-of-the-rank-one-siegel,
PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-eisenstein-series-regularity-on-the-unitary,
PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-square-integrability-criterion-and-hermitian-symmetry,
PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-normalization-of-the-intertwining-operator-between; route 1 brief;
PAPER-CAI-FRIEDBERG-KAPLAN-24/eisenstein-series; PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-holomorphy-of-the-rank-one-siegel;
PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-eisenstein-series-regularity-on-the-unitary;
PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-square-integrability-criterion-and-hermitian-symmetry;
PAPER-CAI-FRIEDBERG-KAPLAN-24/global-integral

**Claim.** The brief says that 'the Mœglin–Waldspurger Eisenstein-series inputs ... are planned nowhere and are built
here', and it imports nothing from AutomorphicSpectralTheory. This is false. AutomorphicSpectralTheory AS.1, AS.2 and
AS.4 plan the general theory these five items use: convergence of Eisenstein series, constant terms as Weyl sums of
intertwining operators, standard and normalized intertwining operators, meromorphic continuation, functional equations,
regularity on the unitary axis, and the residual spectrum along cuspidal data. The roadmap names Mœglin–Waldspurger as
its proof reference. Accepted extractions of other papers already assign this material there.
PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22/28 marks Eisenstein series and intertwining operators of discrete (not only
cuspidal) automorphic forms planned at AS.1–AS.2. PAPER-JIANG-ZHANG-20 route 3 sends the Mœglin–Waldspurger
normalization of GL × GL intertwining operators ([MW89]) to AS.2. Even on the narrowest reading of AS.1 ('cuspidal data
on M'), the rank-one series E_{τ,θ,1} of (4.2) is induced from cuspidal data (|det|^s τ ⊗ θ on the Siegel Levi GL_k ×
G_0), so its constant term and continuation are AS.1–AS.2 material. Two of the three other routes merged into the same
design job (DESIGN-AutomorphicLFunctionsAndLocalFactorsPartII) import Eisenstein series and intertwining operators from
AutomorphicSpectralTheory. The design job therefore receives contradictory instructions, and the Part II would plan this
general theory a second time. Also: The route 1 brief says that 'the Mœglin–Waldspurger Eisenstein-series inputs ... are
planned nowhere and are built here', and it imports neither AutomorphicSpectralTheory nor
AutomorphicFormsOnReductiveGroups. This is false, and as written the Part II would rebuild the general theory of
Eisenstein series, which AutomorphicSpectralTheory owns. (a) The rank-one series E_{τ,θ,1} of
rev-holomorphy-of-the-rank-one-siegel is an Eisenstein series of cuspidal data (τ ⊗ θ on M_P ≅ GL_k × G_0). Its
convergence and its constant term (4.2) are AS.1; the meromorphic continuation of M_0(s) and of the series is AS.2. Yet
the item is 'missing' and routed to the Part II. (b) Part (i) of rev-eisenstein-series-regularity-on-the-unitary ([MW95,
Theorem VI.2.1(i)], holomorphy on Re(s) = 0) is AS.2's regularity on the unitary axis, which AS.2 plans for cuspidal
data. (c) Part (ii) of rev-square-integrability-criterion-and-hermitian-symmetry ([MW95, V.3.13–V.3.16]) rests on the
decomposition of L² along cuspidal data and on the residual spectrum. AS.4 owns these, together with the
pseudo-Eisenstein prefix that the confirmed finding RT-AREA-automorphic-1/5 adds inside AutomorphicSpectralTheory. (d)
The convergence and meromorphic continuation in eisenstein-series ([Lan76, MW95]) are AS.1–AS.2 theory. The accepted
PAPER-JIANG-ZHANG-20/eisenstein-series is also induced from non-cuspidal data, and it is marked planned at AS.1–AS.2.
(e) The absolute convergence of Z in global-integral rests on the rapid decay of cusp forms, which AF.3 plans. Only the
extensions specific to this paper are new: the series induced from the residual ρ_c(τ); [MW95, Remark IV.3.12] in the
form used; Lemma I.4.10; the criterion of §I.4.11; and the Hermitian-symmetry consequence of Remark V.3.6(b).

**Evidence.** AS.1 (data/atlas.json): 'For a rational parabolic P=MN and cuspidal data on M ... Prove absolute
convergence of the Eisenstein sum over P(F)\G(F) in a specified positive chamber ... Derive its constant term as a
finite Weyl sum of intertwining operators in the convergence region'. AS.2: 'Construct global and local standard
intertwiners by convergent unipotent integrals; ... Prove meromorphic continuation of operators and Eisenstein series,
the functional equations and the regularity/unitarity assertions on the relevant unitary axis. ... Construct normalized
intertwiners only after supplying the normalizing factors used in that case.' AS.4: 'Construct discrete cuspidal and
residual subspaces, Eisenstein wave packets and the unitary map from the sum/direct integral over associate cuspidal
data onto L².' AutomorphicSpectralTheory README: 'Mœglin–Waldspurger is requested as a detailed complementary proof
reference.' PAPER-EISCHEN-HARRIS-LI-ETAL-20 route 1 brief: 'Import from: ... Automorphic spectral theory and trace
distributions (AutomorphicSpectralTheory) AS.1–AS.2 (induced families, Eisenstein convergence and continuation; ...)'.
PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22 route 1 brief: 'Automorphic spectral theory and trace distributions
(AutomorphicSpectralTheory) AS.1–AS.3, AS.6 for Eisenstein series, intertwining operators, truncation ...'.
PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22/28, status planned at AS.1 and AS.2: 'For φ ∈ 𝒜_{P,disc}(G) ... E(g, φ, λ) ...
converges for Re λ in a cone and continues meromorphically to a*_{P,ℂ}'.
PAPER-JIANG-ZHANG-20/rev-normalized-gl-gl-intertwining-operators ('holomorphic and non-zero for Re(s) > −1 [MW89]') is
on that paper's route 3 (source, AutomorphicSpectralTheory:AS.2). The paper (arXiv v5, p. 34): '(E_{τ,θ,1})_P(h; s, f) =
f(s, h) + M_0(s)f(s, h), (4.2) where M_0(s) is the standard intertwining operator'; p. 36: 'according to the local
results [MW89, § I.10] the operator L(2s + c′, τ × θ^{−1}τ)/L(2s, τ × θ^{−1}τ) M_2(s) is holomorphic when ...'. Note of
eisenstein-series: 'AutomorphicSpectralTheory:AS.1-AS.2 plan Eisenstein series of cuspidal data; this series is induced
from the residual Speh representation, which only ET.7a touches.' Also: Route 1 brief: 'The GL_N converse theorem ...,
the Langlands classification for G_c and GL_c, Dixmier–Malliavin, the Mœglin–Waldspurger Eisenstein-series inputs and
the Jacquet–Shalika classification are planned nowhere and are built here.' The brief's imports are AL.3, SR.4,
SmoothRepresentationsOfLocalGroups and ET.7a only. Atlas stage AutomorphicSpectralTheory:AS.1: 'For a rational parabolic
P=MN and cuspidal data on M construct sections of normalized induction ... Prove absolute convergence of the Eisenstein
sum over P(F)\G(F) ... Derive its constant term as a finite Weyl sum of intertwining operators in the convergence
region'. AS.2: 'Prove meromorphic continuation of operators and Eisenstein series, the functional equations and the
regularity/unitarity assertions on the relevant unitary axis. Track singular hyperplanes and residues'. AS.4: 'Construct
discrete cuspidal and residual subspaces, Eisenstein wave packets and the unitary map from the sum/direct integral over
associate cuspidal data onto L²'. AutomorphicFormsOnReductiveGroups:AF.3: 'Prove rapid decay on Siegel sets for cusp
forms'. The paper (arXiv v5, p. 34): 'For c = 1, the constant term of E_{τ,θ,1}(h;s,f) along P is given by
(E_{τ,θ,1})_P(h;s,f) = f(s,h) + M_0(s)f(s,h) (4.2)'. p. 36: 'By [MW95, Theorem VI.2.1(i)], E_{τ,θ,c}(s,f) is holomorphic
on Re(s) = 0.' p. 38: 'This follows from the rapid decay of the cusp forms and moderate growth of the series.' The
extraction's own note on eisenstein-series reads: 'AutomorphicSpectralTheory:AS.1-AS.2 plan Eisenstein series of
cuspidal data'.

**Fix.** In route 1's brief: (a) delete 'the Mœglin–Waldspurger Eisenstein-series inputs' from the sentence listing what
is 'planned nowhere and built here'; (b) add the import 'Automorphic spectral theory and trace distributions
(AutomorphicSpectralTheory): AS.1 (Eisenstein convergence, constant terms as Weyl sums of intertwining operators), AS.2
(standard and normalized intertwining operators, meromorphic continuation, functional equations, regularity on the
unitary axis), AS.4 (decomposition along cuspidal data, residual subspaces)'; (c) say that the Part II builds only the
doubling-specific results: Theorem 4.1, Lemmas 4.3 and 4.4, and the constant-term formula (4.5) from [JLZ13]. In the
items: make eisenstein-series agree with PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22/28, i.e. planned at
AutomorphicSpectralTheory:AS.1 and AS.2 with that item's note that the extension from cuspidal to discrete inducing data
belongs there, and take it off route 1. Record for the maintainer that PAPER-EISCHEN-HARRIS-LI-ETAL-20 route 1 instead
keeps the degenerate (non-cuspidal) Siegel case in the Part II, so that one owner is chosen for Eisenstein series with
non-cuspidal inducing data. Split the general statements out of rev-holomorphy-of-the-rank-one-siegel ((4.2) and [MW95,
Remark IV.3.12]), rev-eisenstein-series-regularity-on-the-unitary ([MW95, Theorem VI.2.1(i), Lemma I.4.10]),
rev-square-integrability-criterion-and-hermitian-symmetry ([MW95, §I.4.11, V.3.6(b), V.3.13–V.3.16]) and
rev-normalization-of-the-intertwining-operator-between ([MW89, §I.10]). Put them on a new source route to
AutomorphicSpectralTheory: AS.2 for intertwining operators, their normalization and regularity on the unitary axis,
coalescing with PAPER-JIANG-ZHANG-20 route 3; AS.4 for the square-integrability criterion and L²_𝔛. Keep on route 1 only
their instances for E_{τ,θ,c} and for M_0, M_1 and M_2. Update the report (PAPER-CAI-FRIEDBERG-KAPLAN-24.md) to match.
Also: In the route 1 brief, change 'the Mœglin–Waldspurger Eisenstein-series inputs' in the 'planned nowhere ... built
here' sentence to 'the Mœglin–Waldspurger inputs specific to this paper ([MW95, Remark IV.3.12] as used, Lemma I.4.10,
the criterion of §I.4.11 and Remark V.3.6(b))'. Then add: 'Import from AutomorphicSpectralTheory AS.1–AS.2 the
Eisenstein series of cuspidal data, their constant terms, intertwining operators, meromorphic continuation, functional
equations and regularity on the unitary axis. Import from AS.4 the decomposition along cuspidal data and the residual
spectrum. Import from AutomorphicFormsOnReductiveGroups AF.2–AF.3 constant terms, cusp forms and their rapid decay. The
series induced from the residual ρ_c(τ) is built on these, with a request to AS.2 where the statement is general.' Split
rev-holomorphy-of-the-rank-one-siegel. The constant-term formula (4.2) and the meromorphic continuation of M_0(s) and
E_{τ,θ,1} become status planned [AutomorphicSpectralTheory:AS.1, AutomorphicSpectralTheory:AS.2]. Only the holomorphy
statement of [MW95, Remark IV.3.12] stays missing. In rev-eisenstein-series-regularity-on-the-unitary and
rev-square-integrability-criterion-and-hermitian-symmetry, add notes: the cuspidal-data case of the unitary-axis
regularity is AS.2, and the decomposition along cuspidal data is AS.4. Keep missing only the extension to data induced
from ρ_c(τ) ⊗ θ. In eisenstein-series and global-integral, name AS.1–AS.2 and AF.3 as the theory they build on.

### /2 — duplicate

**Where.** route 1 brief; PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-langlands-classification-for-g-c-and,
PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-langlands-classification-for-gl-c,
PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-archimedean-langlands-parametrisation-with-central-and;
PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-langlands-classification-for-g-c-and; route 1 brief;
PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-langlands-classification-for-g-c-and, route 1 brief;
PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-archimedean-langlands-parametrisation-with-central-and; route 1 brief

**Claim.** The brief contradicts itself, and both of its versions are wrong. Its first paragraph says to 'Import ...
parabolic induction and Langlands quotients from SmoothRepresentationsOfLocalGroups', but no SR stage plans the
Langlands classification or Langlands quotients. Its third paragraph says that 'the Langlands classification for G_c and
GL_c' is 'planned nowhere' and 'built here'. That is also false. (1) p-adic: the accepted source route 3 of
PAPER-GAN-SAVIN-23 sends the Langlands classification for connected reductive groups (which covers Sp_c, SO_c, GSpin_c
and GL_c) to SmoothRepresentationsOfLocalGroups SR.3, and PAPER-GAN-ICHINO-18 route 8 coalesces with it. The confirmed
red-team finding RT-PAPER-GAN-ICHINO-18/6 requires the doubling Part II to import the p-adic theorem from SR.3 and to
split the CFK item. This has not been applied. (2) Archimedean: accepted routes (PAPER-CHENEVIER-TAIBI-20 route 2,
PAPER-GAN-ICHINO-18 route 5, PAPER-NELSON-VENKATESH-21 route 3) send the real Langlands classification and the
correspondence for GL_n(ℝ) and GL_n(ℂ) to AutomorphicFormsOnReductiveGroups AF.1. The confirmed fix of
RT-AREA-automorphic-1/2 gives them to a new stage AF.1b. RT-PAPER-NELSON-VENKATESH-21/5 (confirmed) already counted
three proposed owners of the real classification. Routing these three items wholly to the Part II adds one more owner
for theorems that already have owners. The note of rev-langlands-classification-for-gl-c ('Nothing in the atlas plans
the Langlands classification') also contradicts the note of rev-langlands-classification-for-g-c-and, which records that
ET.6 plans Langlands-quotient theory for p-adic GL_m. Also: The item and the brief plan the Langlands classification in
the doubling Part II, although accepted routes already give it single owners: the p-adic classification for connected
reductive groups goes to SmoothRepresentationsOfLocalGroups SR.3, and the real one to AutomorphicFormsOnReductiveGroups
AF.1 (AF.1b once the RT-AREA-automorphic-1 fixes are applied). The brief also contradicts itself. One sentence says to
import 'parabolic induction and Langlands quotients from SmoothRepresentationsOfLocalGroups'. A later sentence says 'the
Langlands classification for G_c and GL_c ... are planned nowhere and are built here'. The import sentence is also wrong
for archimedean fields. SmoothRepresentationsOfLocalGroups is restricted to non-archimedean fields, and its atlas text
plans no Langlands classification. Yet the paper's local theory runs over archimedean F as well: admissible Fréchet
representations of moderate growth, V(s, τ, c) and V(τ, c), Theorem 3.2(2), and the realisation (3.34) with Lemma 3.22.
The brief imports none of the archimedean foundations. RT-PAPER-GAN-ICHINO-18/6 (confirmed) already asked that the
doubling Part II import the p-adic theorem from SR.3, but this extraction was never changed. Also: Over non-archimedean
F, the Langlands classification already has a single owner, SmoothRepresentationsOfLocalGroups:SR.3, by accepted routes
and an earlier red-team fix. That fix asks this Part II to import it. This extraction instead routes
rev-langlands-classification-for-g-c-and, which covers every local F, wholly to the Part II, and the brief says 'the
Langlands classification for G_c and GL_c' is 'planned nowhere' and 'built here'. The p-adic GL case is also planned:
ET.6 develops 'segment/Langlands-quotient theory' for p-adic GL_m. §3.6 uses the classification throughout (p. 25: 'π is
isomorphic to the image of the convergent intertwining operator I'; p. 32: 'Now write π as the Langlands quotient of σ ⋊
π′ as in (3.16)'). Also: The item has two parts with different owners. (a) The bijection between Irr(GL_N(F)) and
N-dimensional admissible representations of W_F, for F = R or C, is already owned by AutomorphicFormsOnReductiveGroups
AF.1, through accepted source routes of two other papers. AF.1b, created by the RT-AREA-automorphic-1 fixes, is to own
it as well. Routing it again to the doubling Part II duplicates it. (b) Langlands' parametrisation of Irr(G(F)) for G =
Sp_c, SO_c, GSpin_c over R and C [Lan89] is planned nowhere. So is its compatibility with central characters ([Lan89];
[AS06, pp. 178–179]) and with infinitesimal characters ([NP21, Lemma 1]). Part (b) is in route 1, but the brief never
mentions it: it is missing from the brief's 'planned nowhere and are built here' list. Part (b) is on the main chain. It
defines T(π_∞), the archimedean L- and ε-factors of §3.4, (3.13) and Theorem 3.7. The proof of Theorem 0.1 sets Π_ν =
T_ν(π_ν) at every infinite place. Definition 2.2 compares infinitesimal characters through it. A special case (GSp_4(R)
≅ GSpin_5(R) to GL_4(R)) is also source-routed by PAPER-CALEGARI-GERAGHTY-20 to ModularityAndLanglandsExtensions.

**Evidence.** Route 1 brief: 'Import ... parabolic induction and Langlands quotients from
SmoothRepresentationsOfLocalGroups' and 'The GL_N converse theorem ..., the Langlands classification for G_c and GL_c,
Dixmier–Malliavin, the Mœglin–Waldspurger Eisenstein-series inputs and the Jacquet–Shalika classification are planned
nowhere and are built here.' SR.0–SR.6 stage texts in data/atlas.json contain neither 'Langlands classification' nor
'Langlands quotient'. PAPER-GAN-SAVIN-23/rev-langlands-classification-and-harish-chandra: 'Let G be connected reductive
over F. (a) (Langlands classification: Silberger, Borel–Wallach, Konno) Every irreducible smooth representation π of
G(F) is the unique irreducible quotient J(P, σ, ν) of a standard module', route 3 (source,
SmoothRepresentationsOfLocalGroups:SR.3), review verdict accept. PAPER-GAN-ICHINO-18 route 8 reason: 'the doubling Part
II of PAPER-CAI-FRIEDBERG-KAPLAN-24 should import the p-adic theorem from SR.3 (RT-PAPER-GAN-ICHINO-18/6)'.
research/blueprint/redteam/RT-PAPER-GAN-ICHINO-18.review.json, finding 6, confirmed: 'Split the CFK item: its
archimedean classification and realization by convergent intertwining integrals do not follow from this p-adic quotient
theorem and must keep their own sources and owners.' research/blueprint/redteam/RT-AREA-automorphic-1.fixes.md, /2: new
stage AF.1b owning '2. The Langlands classification: unique irreducible quotients of standard modules with tempered
inducing data ...' and '5. The correspondence for GL_n(ℝ) and GL_n(ℂ)'. PAPER-CHENEVIER-TAIBI-20/archimedean-llc-gln and
PAPER-GAN-ICHINO-18/llc-gln-arch: source routes to AutomorphicFormsOnReductiveGroups:AF.1. PAPER-NELSON-VENKATESH-21/30
'The Langlands classification (cited)': route 3, source AF.1. Also: The brief says: 'Import Rankin–Selberg factors from
layer AL.3, the Satake isomorphism from SmoothRepresentationsOfLocalGroups (SR.4), and parabolic induction and Langlands
quotients from SmoothRepresentationsOfLocalGroups.' It also says: 'The GL_N converse theorem of
Cogdell–Piatetski-Shapiro (with the η-twists of CKPSS), the Langlands classification for G_c and GL_c, ... are planned
nowhere and are built here.' The SmoothRepresentationsOfLocalGroups summary in the atlas reads: 'the general local
representation theory of G(E), for a connected reductive group over a nonarchimedean local field E'. Item
PAPER-GAN-SAVIN-23/rev-langlands-classification-and-harish-chandra reads: 'Let G be connected reductive over F. (a)
(Langlands classification ...) Every irreducible smooth representation π of G(F) is the unique irreducible quotient J(P,
σ, ν) of a standard module ...'. It is in that paper's route 3 (source, SmoothRepresentationsOfLocalGroups:SR.3), which
its review accepts. The reason of PAPER-GAN-ICHINO-18 route 8 says: 'the doubling Part II of
PAPER-CAI-FRIEDBERG-KAPLAN-24 should import the p-adic theorem from SR.3 (RT-PAPER-GAN-ICHINO-18/6)'. The verdict on
that finding reads: 'Split the CFK item: its archimedean classification and realization by convergent intertwining
integrals do not follow from this p-adic quotient theorem and must keep their own sources and owners.' The
RT-AREA-automorphic-1 fixes (finding /2, confirmed) create AF.1b with '2. The Langlands classification: unique
irreducible quotients of standard modules with tempered inducing data ...' and '4. The Casselman–Wallach globalization'.
PAPER-NELSON-VENKATESH-21 route 3 sends the real classification to AF.1. The paper (arXiv v5, p. 11) says: 'An
admissible representation over an archimedean field is understood to be admissible Fréchet of moderate growth.' On p. 25
it says: 'The representation π is isomorphic to the image of the convergent intertwining operator I ... See Waldspurger
[Wal03, § IV.1] and Wallach [Wal88, § 5] ... We provide a quick proof of convergence, for any w, in Lemma 3.22 below'.
Also: PAPER-GAN-SAVIN-23/rev-langlands-classification-and-harish-chandra ('Let G be connected reductive over F. (a)
(Langlands classification …) Every irreducible smooth representation π of G(F) is the unique irreducible quotient J(P,
σ, ν) of a standard module …') is in an accepted source route to SmoothRepresentationsOfLocalGroups:SR.3. Route 8 of
PAPER-GAN-ICHINO-18 (FIX-RT-PAPER-GAN-ICHINO-18) gives as its reason: 'SR.3 already receives the p-adic Langlands
classification for connected reductive groups (PAPER-GAN-SAVIN-23). … it is planned once … at SR.3. … the doubling Part
II of PAPER-CAI-FRIEDBERG-KAPLAN-24 should import the p-adic theorem from SR.3 (RT-PAPER-GAN-ICHINO-18/6).' Atlas stage
EndoscopicTransferAndUnitaryTraceComparison:ET.6: 'Develop the needed supercuspidal/type and segment/Langlands-quotient
theory'. Route 1 brief: 'the Langlands classification for G_c and GL_c, … are planned nowhere and are built here.' Also:
The item reads: 'Every π ∈ Irr(G) is parametrised by an admissible homomorphism φ_π: W_F → Ĝ, and Irr(GL_N) is in
bijection with the admissible homomorphisms W_F → GL_N(C) [Lan89]'. Item PAPER-CHENEVIER-TAIBI-20/archimedean-llc-gln
reads: 'There is a natural bijection V ↦ L(V) between isomorphism classes of irreducible admissible Harish-Chandra
modules for GL_n(R) and ... n-dimensional ... representations of the Weil group W_R'. It is in route 2 (source
AutomorphicFormsOnReductiveGroups:AF.1), which its review accepts. Item PAPER-GAN-ICHINO-18/llc-gln-arch reads: 'For F =
R or C ... Langlands' classification gives a bijection Irr GL_n(F) ↔ {n-dimensional semisimple representations of L_F}'.
It is in route 5 (source AF.1), accepted with the reason 'The archimedean LLC for GL_n is Langlands' classification, in
AF.1.' The RT-AREA-automorphic-1 fixes for AF.1b list '5. The correspondence for GL_n(ℝ) and GL_n(ℂ)' and add
'Endoscopic packets and Shelstad's theorems stay with the endoscopy roadmaps'. Item
PAPER-CALEGARI-GERAGHTY-20/archimedean-transfer-gsp4-gl4 reads: 'archimedean local Langlands for GSp₄(R) composed with
the spin embedding GSp₄(C) ⊂ GL₄(C)'. The paper (arXiv v5, p. 12) says: 'When F is archimedean, by Langlands [Lan89],
any π ∈ Irr(G) is parameterized by an admissible homomorphism φ : W_F → Ĝ ... r_G ∘ φ ... parameterizes a representation
Π ∈ Irr(GL_N), which is the archimedean functorial transfer of π'. On p. 40 it says: 'For the places ν ∈ S∞, Πν = Tν(πν)
is the archimedean functorial transfer (see § 3.2).' The brief's 'planned nowhere and are built here' list names the
converse theorem, the Langlands classification, Dixmier–Malliavin, the Mœglin–Waldspurger inputs and the Jacquet–Shalika
classification, but not [Lan89].

**Fix.** Split each of the three items. (1) Put the p-adic Langlands classification in
rev-langlands-classification-for-g-c-and and rev-langlands-classification-for-gl-c on a new source route to
SmoothRepresentationsOfLocalGroups (stage SR.3), with status missing, coalescing with PAPER-GAN-SAVIN-23 route 3 and
PAPER-GAN-ICHINO-18 route 8. (2) Put the archimedean Langlands classification in the same two items, and the bijection
Irr(GL_N) ↔ admissible homomorphisms W_F → GL_N(ℂ) in rev-archimedean-langlands-parametrisation-with-central-and, on a
new source route to AutomorphicFormsOnReductiveGroups (AF.1, to be read as AF.1b once the RT-AREA-automorphic-1 fixes
are in the atlas), as PAPER-CHENEVIER-TAIBI-20 route 2 and PAPER-GAN-ICHINO-18 route 5 do. (3) Keep on route 1 only what
those owners do not state, which is what the RT-PAPER-GAN-ICHINO-18/6 verdict keeps with CFK. That is the realisation of
π and π^∨ as the images of the intertwining integrals I and I^∨ ((3.34), with the archimedean convergence against smooth
vectors of Lemma 3.22), the GSpin normalisation by |Υ|^r, and Langlands's archimedean parametrisation of Irr(G_c) with
the central character of T(π). In the brief, replace 'parabolic induction and Langlands quotients from
SmoothRepresentationsOfLocalGroups' with 'parabolic induction from Smooth representations of local groups
(SmoothRepresentationsOfLocalGroups) SR.2 and Automorphic forms on reductive groups (AutomorphicFormsOnReductiveGroups)
AF.1; the p-adic Langlands classification from SR.3; the real Langlands classification and the correspondence for
GL_N(ℝ) and GL_N(ℂ) from AF.1 (AF.1b)'. Delete 'the Langlands classification for G_c and GL_c' from the 'planned
nowhere' sentence. Correct the note of rev-langlands-classification-for-gl-c, and update the report
(PAPER-CAI-FRIEDBERG-KAPLAN-24.md). Also: Split the item. (a) The Langlands classification itself: in its p-adic case,
add it to a source route to SmoothRepresentationsOfLocalGroups (SR.3), the owner set by PAPER-GAN-SAVIN-23. In its
archimedean case, add it to a source route to AutomorphicFormsOnReductiveGroups (AF.1, to become AF.1b). (b) Keep in
route 1 only the G_c-specific parts. These are the form (3.16) in the i_{M_R}/Υ normalisation (a_d > r, with both Siegel
parabolics allowed for SO_2n and GSpin_2n) and the realisation of π and π^∨ as images of the convergent integrals I and
I^∨ (3.34), with their convergence ([Wal03], [Wal88], Lemma 3.22). In the brief, replace the import sentence with
'p-adic parabolic induction from SmoothRepresentationsOfLocalGroups (SR.2) and the p-adic Langlands classification from
SR.3; archimedean admissible Fréchet representations, the Casselman–Wallach globalization and the real Langlands
classification from AutomorphicFormsOnReductiveGroups AF.1 (AF.1b)'. In the 'planned nowhere and are built here' list,
replace 'the Langlands classification for G_c and GL_c' with 'the G_c-specific Langlands data (3.16) and the
intertwining-integral realisation (3.34)'. Update the report's route section to match. Also: Split
rev-langlands-classification-for-g-c-and. (a) The p-adic Langlands classification for connected reductive groups
(existence and uniqueness of standard-module data): move it to a source route to SmoothRepresentationsOfLocalGroups
(stage SR.3), coalesced with PAPER-GAN-SAVIN-23 and PAPER-GAN-ICHINO-18. (b) Keep in route 1 the parts that are not
planned elsewhere: the archimedean classification; the G_c-specific form (3.16) through i_{M_R} and Υ with a_d > r; and
the realisation of π and π^∨ as images of I and I^∨ (3.34), convergent on smooth vectors. In route 1's brief, replace
'the Langlands classification for G_c and GL_c … planned nowhere' with an import of the p-adic classification from SR.3
(and of p-adic GL Langlands quotients from ET.6), keeping only the archimedean and G_c-specific parts as built here.
Also: Split the item. Move the GL_N bijection, with its L- and ε-factors, to a source route to
AutomorphicFormsOnReductiveGroups (AF.1, to become AF.1b), as CHENEVIER-TAIBI-20 and GAN-ICHINO-18 do. Keep in route 1
the parametrisation of Irr(G(R)) and Irr(G(C)) for G = Sp_c, SO_c, GSpin_c by φ: W_F → Ĝ, with the central-character
compatibility (central character of T(π) = χ_π^{N/2}) and the infinitesimal-character compatibility ([NP21, Lemma 1]).
Add to the brief's 'built here' list: 'Langlands' archimedean parametrisation for split Sp_c, SO_c and GSpin_c [Lan89],
with its central- and infinitesimal-character compatibilities; the GL_N correspondence is imported from
AutomorphicFormsOnReductiveGroups AF.1 (AF.1b)'. Also note in the brief that PAPER-CALEGARI-GERAGHTY-20 routes the GSp_4
≅ GSpin_5 case to ModularityAndLanglandsExtensions, so that one owner is chosen.

### /3 — duplicate

**Where.** route 1 brief; PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-dixmier-malliavin-factorization;
PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-langlands-classification-for-gl-c;
PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-exponents-of-unitary-generic-representations-of;
PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-dixmier-malliavin-factorization; route 1 brief;
PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-jacquet-shalika-classification-automorphic-representations-of; route 1 brief;
PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-exponents-of-unitary-generic-representations-of;
PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-dixmier-malliavin-factorization, route 1 brief;
PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-jacquet-shalika-classification-automorphic-representations-of; route 1; route 1 brief

**Claim.** The route 1 brief says that 'the Langlands classification for G_c and GL_c, Dixmier–Malliavin, ... are
planned nowhere and are built here', and the extraction routes the three Appendix A inputs
rev-dixmier-malliavin-factorization, rev-langlands-classification-for-gl-c and
rev-exponents-of-unitary-generic-representations-of to the new Part II
AutomorphicLFunctionsAndLocalFactorsPartIIDoubling. All three already have owners in existing atlas layers, through the
atlas text itself or through accepted routes of other extractions, so the Part II would build them a second time. (a)
Dixmier–Malliavin is routed to AutomorphicFormsOnReductiveGroups:AF.1 by PAPER-JIANG-ZHANG-20 route 6 (item
dixmier-malliavin) and by PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22 route 6 (item 17). Both routes are accepted. (b) The
p-adic Langlands classification for every connected reductive group, which covers GL_c and G_c, is routed to
SmoothRepresentationsOfLocalGroups:SR.3 by PAPER-GAN-SAVIN-23 route 3 (item
rev-langlands-classification-and-harish-chandra; accepted). Atlas stage ET.6 also plans the segment and
Langlands-quotient classification of p-adic GL_m. The archimedean Langlands classification is assigned to the new stage
AutomorphicFormsOnReductiveGroups:AF.1b by the confirmed finding RT-AREA-automorphic-1/2. (c) The first sentence of
rev-exponents-of-unitary-generic-representations-of (unitary generic representations of GL_k are irreducibly induced
with exponents in (−1/2, 1/2)) is routed to ET.6 for p-adic fields (PAPER-JIANG-ZHANG-20 route 5, item
tadic-unitary-dual) and to AF.1 for archimedean fields (PAPER-JIANG-ZHANG-20 route 6, item vogan-unitary-dual). Both
routes are accepted. The brief also contradicts itself, because a few lines earlier it says 'Import ... parabolic
induction and Langlands quotients from SmoothRepresentationsOfLocalGroups'. Finally, the note of
rev-langlands-classification-for-gl-c ('Nothing in the atlas plans the Langlands classification') is false for p-adic
GL_c, given ET.6's text. Also: The item's note says 'nothing in the atlas plans it', and the brief lists
Dixmier–Malliavin among the results that are 'planned nowhere and are built here'. But two accepted extractions already
send the same theorem to AutomorphicFormsOnReductiveGroups AF.1 by source routes. They are
PAPER-JIANG-ZHANG-20/dixmier-malliavin (route 6) and PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22/17 (route 6), and the
second says that its route coalesces with the first. Routing it to the Part II creates a second owner. Neither library
has the theorem: the pinned declaration index contains no declaration whose name mentions Dixmier or Malliavin. Also:
The brief lists 'the Jacquet–Shalika classification' as planned nowhere and built in the Part II, and the item is on
route 1. Four accepted extractions send the same theorem ([JS81a, Theorem 4.4]: the isobaric cuspidal data of an
automorphic representation of GL_N are determined by almost all of its local components) to
AutomorphicLFunctionsAndLocalFactors AL.3 by source routes. A fifth, PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21, sends it to
AutomorphicSpectralTheoryPartIISchwartzMultipliers. CFK adds a third proposed owner. Also: The item's main assertion is
the classification of irreducible generic unitary representations of GL_k(F): every such representation is irreducibly
induced from essentially square-integrable representations with exponents |α_i| < 1/2. The item is routed to the Part
II. The accepted extraction PAPER-JIANG-ZHANG-20 already sends the same theorem to its owners: Tadić's p-adic case to
ET.6 (route 5) and Vogan's archimedean case to AutomorphicFormsOnReductiveGroups AF.1 (route 6). Only the consequence
the paper uses, that L^RS(s, σ_0 × τ) is holomorphic in Re(s) ≥ 1/2 for tempered σ_0, is specific to this paper. Also:
The classical Dixmier–Malliavin theorem already has an owner in the atlas. Two accepted extractions route it as a source
of AutomorphicFormsOnReductiveGroups:AF.1. This extraction routes the same statement to the new Part II, and route 1's
brief wrongly says Dixmier–Malliavin is 'planned nowhere' and 'built here'. The theorem would be planned twice. Also:
The extraction routes the Jacquet–Shalika classification to the Part II: the cuspidal data of an automorphic
representation of GL_N(A) are determined by almost all of its local components ([JS81a, Theorem 4.4]). The brief calls
it 'planned nowhere' and 'built here'. But four accepted extractions route the same theorem, by source routes, to
AutomorphicLFunctionsAndLocalFactors AL.3. Building it in the Part II duplicates that.

**Evidence.** Atlas stage EndoscopicTransferAndUnitaryTraceComparison:ET.6: 'Develop the needed supercuspidal/type and
segment/Langlands-quotient theory; prove the classification and induction compatibilities instead of importing them as
data fields.' PAPER-JIANG-ZHANG-20, route 6 (source, AutomorphicFormsOnReductiveGroups, stages [AF.1], items
vogan-unitary-dual and dixmier-malliavin), reason: 'AF.1 owns real reductive representation theory and smooth Fréchet
globalizations. Vogan's generic unitary dual of GL_n(R) and GL_n(C), and the Dixmier–Malliavin lemma, are archimedean
inputs of that kind.' Review verdict: accept. PAPER-JIANG-ZHANG-20, route 5 (source,
EndoscopicTransferAndUnitaryTraceComparison, stages [ET.6], item tadic-unitary-dual: '[Tad86]: every irreducible generic
unitary representation of GL_a over a non-archimedean field is an irreducible representation induced from tempered
representations and complementary-series pairs with exponents in (0, ½)'). Review verdict: accept.
PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22, route 6 (source, AF.1, item 17 'The Dixmier–Malliavin theorem'). Review
verdict: accept; its reason reads 'PAPER-JIANG-ZHANG-20 already routes the same statement there'. PAPER-GAN-SAVIN-23,
route 3 (source, SmoothRepresentationsOfLocalGroups, stages [SR.3]), item
rev-langlands-classification-and-harish-chandra: 'Let G be connected reductive over F. (a) (Langlands classification
...) Every irreducible smooth representation π of G(F) is the unique irreducible quotient J(P, σ, ν) of a standard
module'. Review verdict: accept. RT-AREA-automorphic-1/2 is confirmed by REV-RT-AREA-automorphic-1, and its fix reads:
'Create a new stage AF.1b, Real reductive representation theory ... It owns Casselman's subrepresentation theorem ...,
the Langlands classification, the discrete series ... the Langlands correspondence for GL_n(ℝ) and GL_n(ℂ)'. The paper
uses exactly these inputs in Appendix A: DM78 on pp. 43, 46–47, 52–53; Langlands data in Lemma A.8 and Proposition A.10
(arXiv v5, pp. 51–55); and the exponent bound on p. 54 ('the poles of L(s + a_1, σ_{1,0} × τ) are contained in Re(s) +
a_1 < 1/2 ... (τ is generic and unitary)'). Also: PAPER-JIANG-ZHANG-20/dixmier-malliavin: 'Every smooth vector of a
smooth Fréchet representation of a real Lie group is a finite sum of vectors π(f)v with f ∈ C_c^∞ [DM78]', note 'Routed
to AF.1, which builds smooth Fréchet globalizations', route 6 (source, AutomorphicFormsOnReductiveGroups:AF.1).
PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22/17 'The Dixmier–Malliavin theorem', note: 'PAPER-JIANG-ZHANG-20 routes the same
lemma as a source of AF.1; this route coalesces with it.' The reviews of both papers accept these routes. Route 1 brief:
'... Dixmier–Malliavin, ... are planned nowhere and are built here.' The paper (arXiv v5, p. 20): 'by the
Dixmier–Malliavin Theorem [DM78] it is sufficient to consider ξ of the form ...'. The pinned declaration index (Mathlib
082e2d3, Tau Ceti f790474) has no match for 'Dixmier' or 'Malliavin'. Also: PAPER-GAN-ICHINO-18/strong-multiplicity-one
(route 6, source AL.3): 'if σ_1 ⊞ ⋯ ⊞ σ_r and σ′_1 ⊞ ⋯ ⊞ σ′_{r′} have isomorphic local components at almost all places,
then r = r′ and, after renumbering, σ′_i ≅ σ_i for every i.'
PAPER-CALEGARI-GERAGHTY-20/ext-jacquet-shalika-strong-multiplicity-one (route 25, source AL.3);
PAPER-CARAIANI-SCHOLZE-17/154 (route 16, source AL.3); PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22/71 (route 7, source
AL.3); PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/jacquet-shalika-classification-gl-n (route 1, part-ii
AutomorphicSpectralTheoryPartIISchwartzMultipliers). All five reviews accept these routes. The paper (arXiv v5, p. 41):
'By the classification of [JS81a, § 4] and the multiplicativity of the Rankin–Selberg γ-factors ([JPSS83, JS90]), if the
statement of the theorem holds for one weak functorial transfer of π, it is true for any such transfer.' Also:
PAPER-JIANG-ZHANG-20/tadic-unitary-dual: '[Tad86]: every irreducible generic unitary representation of GL_a over a
non-archimedean field is an irreducible representation induced from tempered representations and complementary-series
pairs with exponents in (0, ½)', route 5 (source, EndoscopicTransferAndUnitaryTraceComparison:ET.6);
PAPER-JIANG-ZHANG-20/vogan-unitary-dual: '[Vog86]: the same description of the irreducible generic unitary
representations of GL_a over R and C', route 6 (source, AutomorphicFormsOnReductiveGroups:AF.1); the review accepts both
routes. CFK item: 'Every unitary τ ∈ Irr_gen(GL_k(F)) is irreducibly induced as τ ≅ |det|^{α_1}δ_1 × ... ×
|det|^{α_r}δ_r, with δ_i square-integrable and α_i real, |α_i| < 1/2.' Also: PAPER-JIANG-ZHANG-20/dixmier-malliavin
('Every smooth vector of a smooth Fréchet representation of a real Lie group is a finite sum of vectors π(f)v with f ∈
C_c^∞ [DM78]') is in an accepted source route to AutomorphicFormsOnReductiveGroups, stage AF.1, whose reason reads 'AF.1
owns real reductive representation theory and smooth Fréchet globalizations. … the Dixmier–Malliavin lemma, are
archimedean inputs of that kind.' PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22/17 is routed to the same stage:
'PAPER-JIANG-ZHANG-20 already routes the Dixmier–Malliavin lemma there'. Both reviews accept these routes. Route 1 brief
of this extraction: 'The GL_N converse theorem …, the Langlands classification for G_c and GL_c, Dixmier–Malliavin, …
are planned nowhere and are built here.' Also: Route 1 brief: '... the Mœglin–Waldspurger Eisenstein-series inputs and
the Jacquet–Shalika classification are planned nowhere and are built here.' Accepted source routes to
AutomorphicLFunctionsAndLocalFactors [AL.3]: PAPER-CARAIANI-SCHOLZE-17 route 16, item 154 ('An isobaric automorphic
representation of GL_m(A_F) ... is determined by its Satake parameters outside any finite set S of places [JS81]');
PAPER-GAN-ICHINO-18 route 6, item strong-multiplicity-one; PAPER-CALEGARI-GERAGHTY-20 route 25, item
ext-jacquet-shalika-strong-multiplicity-one; PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22 route 7, item 71. A further route,
PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21 route 1, sends [JS81a, Theorem 4.4] itself to
AutomorphicSpectralTheoryPartIISchwartzMultipliers. The paper (arXiv v5, p. 41): 'By the classification of [JS81a, § 4]
and the multiplicativity of the Rankin–Selberg γ-factors ([JPSS83, JS90]), if the statement of the theorem holds for one
weak functorial transfer of π, it is true for any such transfer.'

**Fix.** In route 1, remove the three items from 'items'. Add source routes instead. (1)
PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-dixmier-malliavin-factorization goes to AutomorphicFormsOnReductiveGroups, stages
[AutomorphicFormsOnReductiveGroups:AF.1] (AF.1b once the RT-AREA-automorphic-1 fixes are applied), as
PAPER-JIANG-ZHANG-20 and PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22 route it. (2) Split
rev-langlands-classification-for-gl-c into a non-archimedean part and an archimedean part. The non-archimedean part,
including the unramified-data clause, goes to SmoothRepresentationsOfLocalGroups [SR.3], with the general statement of
PAPER-GAN-SAVIN-23; the note should say that ET.6 plans the GL_m segment form. The archimedean part goes to
AutomorphicFormsOnReductiveGroups [AF.1], AF.1b after RT-AREA-automorphic-1. Keep the intertwining-image clause in the
Part II only if neither owner states it. (3) Split rev-exponents-of-unitary-generic-representations-of. Its
classification sentence is routed as a source to ET.6 (p-adic, as tadic-unitary-dual) and to AF.1 (archimedean, as
vogan-unitary-dual). Its consequence (L^RS(s, σ_0 × τ) holomorphic in Re(s) ≥ 1/2 for tempered σ_0) stays a Part II item
that imports AL.3. Replace the note of rev-langlands-classification-for-gl-c ('Nothing in the atlas plans...') with
these owners. In the brief, delete 'the Langlands classification for G_c and GL_c, Dixmier–Malliavin' from the 'planned
nowhere and are built here' sentence. Replace it with: 'Import the non-archimedean Langlands classification from
SmoothRepresentationsOfLocalGroups SR.3 (ET.6 for the GL_m segment form), the archimedean classification and
Dixmier–Malliavin from AutomorphicFormsOnReductiveGroups AF.1 (AF.1b), and the unitary generic dual of GL_k from ET.6
and AF.1.' The same owners apply to rev-langlands-classification-for-g-c-and, the item for G_c. Update the route count
in the report (PAPER-CAI-FRIEDBERG-KAPLAN-24.md). Also: Take rev-dixmier-malliavin-factorization off route 1 and put it
on a new source route to AutomorphicFormsOnReductiveGroups (stage AF.1; the RT-AREA-automorphic-1 fixes move the
Casselman–Wallach globalization to AF.1b), coalescing with PAPER-JIANG-ZHANG-20 route 6 and
PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22 route 6. Correct its note. In the brief, delete 'Dixmier–Malliavin' from the
'planned nowhere' sentence and list it as an import from AF.1. Also: Take the Jacquet–Shalika part of
rev-jacquet-shalika-classification-automorphic-representations-of ([JS81a, Theorem 4.4], with [Lan79b]) off route 1 and
put it on a new source route to AutomorphicLFunctionsAndLocalFactors (stage AL.3), coalescing with PAPER-GAN-ICHINO-18
route 6. If the γ-factor consequence for Π_ν and Π′_ν is to be kept, make it a separate route-1 item. Delete 'the
Jacquet–Shalika classification' from the brief's 'planned nowhere' sentence. In the report
(PAPER-CAI-FRIEDBERG-KAPLAN-24.md), note for the maintainer that PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21 routes the same
theorem to another owner. Also: Split the item. Put the classification on new source routes, coalescing with
PAPER-JIANG-ZHANG-20 routes 5 and 6: the p-adic case to EndoscopicTransferAndUnitaryTraceComparison (ET.6) and the
archimedean case to AutomorphicFormsOnReductiveGroups (AF.1). Keep on route 1 only the consequence for the poles of L(s
+ a, σ_0 × τ) and L(1 − s − a, σ_0^∨ × τ^∨) used in Proposition A.10, or route that consequence to AL.3 with the other
Rankin–Selberg facts. Also: Remove rev-dixmier-malliavin-factorization from route 1. Add a source route to
AutomorphicFormsOnReductiveGroups (stages AutomorphicFormsOnReductiveGroups:AF.1) carrying it, with a reason that
coalesces it with PAPER-JIANG-ZHANG-20/dixmier-malliavin and PAPER-BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22/17. In route 1's
brief, delete 'Dixmier–Malliavin' from the 'planned nowhere and built here' list and add 'Dixmier–Malliavin from
AutomorphicFormsOnReductiveGroups AF.1' to the imports. The holomorphic-family version of [CFK22, Appendix A] is a
separate item and stays in the Part II. Also: Remove the item from route 1's items. Add a source route {route: source,
roadmap: AutomorphicLFunctionsAndLocalFactors, stages: [AutomorphicLFunctionsAndLocalFactors:AL.3], items:
[PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-jacquet-shalika-classification-automorphic-representations-of]}, with the reason that
the four accepted extractions route this classification to AL.3. In the brief, delete 'and the Jacquet–Shalika
classification' from the 'planned nowhere ... built here' sentence and add it to the AL.3 import. Note the duplicate
Part II route of PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21 for the maintainer.

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | duplicate | route 1 brief; … | The brief says that 'the Mœglin–Waldspurger Eisenstein-series inputs ... are planned nowhere and are built here', and it imports nothing from … |
| /2 | high | duplicate | route 1 brief; … | The brief contradicts itself, and both of its versions are wrong. Its first paragraph says to 'Import ... parabolic induction and Langlands quotients from … |
| /3 | high | duplicate | route 1 brief; … | The route 1 brief says that 'the Langlands classification for G_c and GL_c, Dixmier–Malliavin, ... are planned nowhere and are built here', and the extraction … |
| /4 | medium | error | PAPER-CAI-FRIEDBERG-KAPLAN-24/rs-factors; … | rs-factors is marked planned at AL.3, but its statement includes the extension of the Rankin–Selberg γ-, L- and ε-factors to all irreducible admissible, not … |
| /5 | medium | error | PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-poles-and-non-vanishing-of-global; … | The item is marked planned at AL.3, but AL.3 does not plan all of it. (1) Non-vanishing on Re(s) = 1 ([Sha81]) is planned nowhere. AL.3 only asks to 'state … |
| /6 | medium | error | PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-global-generalized-speh-representati …; … | (1) The item is marked planned at ET.7a, but part of it is not planned there. ET.7a plans 'the required GL_m residual-spectrum/Speh classification' from … |
| /7 | medium | duplicate | PAPER-CAI-FRIEDBERG-KAPLAN-24/speh; … | The p-adic Speh representation that speh constructs on route 1 already has an owner, and the merged design job receives two contradictory instructions about … |
| /8 | medium | library-claim | PAPER-CAI-FRIEDBERG-KAPLAN-24/groups; … | groups is marked missing and cites neither library declarations nor planned layers, but parts of it exist or are planned. Tau Ceti at f790474 has … |
| /9 | medium | error | route 1 brief; … | PROTOCOL section 16 asks the brief to state the final theorems exactly as the paper does. The brief paraphrases them instead, and the paraphrase drops … |
| /10 | medium | missing | the extraction's top-level prerequisites list (absent); … | The extraction has no top-level 'prerequisites' list. PROTOCOL §16 requires one, and 237 of the 239 paper extractions have it. In this share almost every cited … |
| /11 | medium | error | PAPER-CAI-FRIEDBERG-KAPLAN-24/speh, … | Every local item in this share says only 'Let F be local' or 'non-archimedean' and drops the paper's standing hypothesis that F has characteristic 0. The … |
| /12 | medium | missing | PAPER-CAI-FRIEDBERG-KAPLAN-24/kc-bound, … | The proofs of Lemmas 3.13 and 3.14 consist of appeals to cited results that no item covers. (i) The support of g ↦ W(diag(g, I_{(k−1)c})) lies in the support … |
| /13 | medium | missing | PAPER-CAI-FRIEDBERG-KAPLAN-24/Z2 | The convergence of Z^2 (Proposition 3.17) and of the Appendix A integrals rests on growth bounds for matrix coefficients of σ^∨ ∈ Irr(GL_l). Over … |
| /14 | medium | missing | PAPER-CAI-FRIEDBERG-KAPLAN-24/Z1-open-cell, … | Three cited results used in the proofs of Proposition 3.18 and Lemma 3.20 are not items. (1) [HS16, Lemma 6.2.5] controls the G_0-projection of conjugated Levi … |
| /15 | medium | missing | PAPER-CAI-FRIEDBERG-KAPLAN-24/Z-over-sigma, … | Over archimedean F, the proof of Corollary 3.21 needs Dixmier–Malliavin for holomorphic families of sections. An entire section f ∈ V(τ, c) must be a finite … |
| /16 | medium | duplicate | PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-bounds-for-smooth-matrix-coefficient … | The first half of this item is the bound /⟨σ(m)v, w⟩/ ≤ β(v)β(w)Ξ(m) for smooth vectors of a tempered representation of a real reductive group, with β a … |
| /17 | medium | error | PAPER-CAI-FRIEDBERG-KAPLAN-24/poles-local, route 1 brief | poles-local states Theorem 3.12 for all k ≥ 1, but its prerequisites (langlands-quotient-poles, Z-over-sigma, doubling-integral) cover only k > 1. The review's … |
| /18 | medium | missing | PAPER-CAI-FRIEDBERG-KAPLAN-24/main; … | The proof of Theorem 0.1 must verify one hypothesis of the Converse Theorem: that L(s, Π) converges absolutely in a right half-plane. It does so by asserting … |
| /19 | medium | missing | PAPER-CAI-FRIEDBERG-KAPLAN-24/main; … | The proof of Theorem 0.1 opens with 'For the proof we can assume π is unitary'. Everything after that step is for unitary π: Theorem 4.8 assumes it, and so … |
| /20 | medium | error | PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-square-integrability-criterion-and-h … | Part (i) says that the negative-cone condition of [MW95, §I.4.11], 'with M ≅ GL_k^c', 'reads Σ_{i<=j} Re(e_i) < 0 for 1 <= j <= c'. This reading is right when … |
| /21 | medium | missing | PAPER-CAI-FRIEDBERG-KAPLAN-24/coarse-global; … | No item states that cuspidal automorphic representations of GL_l(A) are globally generic, and hence that all their local components are generic (and unitary … |
| /22 | medium | missing | PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-analytic-properties-of-the-gl-c; … | No item covers Bernstein's continuation principle in the form of Banks [Ban98]. The appendix cites it as the source of meromorphic continuation (rationality in … |
| /23 | low | error | route 1 brief | The brief says 'PAPER-ATOBE-KONDO-YASUDA-22 proposes a separate Part II, AutomorphicLFunctionsPartIISpehIntegrals'. In the queue it is not separate. make_queue … |
| /24 | low | other | route 1 brief | PROTOCOL section 16 asks the brief to name the roadmaps it imports from by title and id. The brief names them by id or layer only ('layer AL.3', … |
| /25 | low | other | PAPER-CAI-FRIEDBERG-KAPLAN-24/main; … | As the paper itself notes, for Sp_c and quasi-split SO_c the statement of Theorem 0.1 also follows from Arthur's classification. The atlas registers Arthur's … |
| /26 | low | other | PAPER-CAI-FRIEDBERG-KAPLAN-24/local-factors, …; … | The extraction records dependencies in the items' 'prerequisites' fields. The 30 items added by the review have no 'prerequisites' field, and no item lists any … |
| /27 | low | error | PAPER-CAI-FRIEDBERG-KAPLAN-24/groups; … | The paper says 'Dually, e_0 is the similitude character of Ĝ_l' and writes e_0(g) for the similitude of Ĝ: in GO_l(C) and GSp_{l−1}(C), in the dual Levi … |
| /28 | low | error | PAPER-CAI-FRIEDBERG-KAPLAN-24/converse; … | The item is named 'Converse Theorem of Cogdell–Kim–Piatetski-Shapiro–Shahidi', and the brief's first paragraph says 'the Cogdell–Kim–Piatetski-Shapiro–Shahidi … |
| /29 | low | error | PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-weak-transfer-of-all-irreducible-aut … | The item's argument says 'Theorem 0.1 applies to the G_{c−2l} factor, and the transfer is the corresponding isobaric sum'. Theorem 0.1 is stated only for G_c … |
| /30 | low | error | PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-twisted-euler-products-for-the-conve …; … | Two locators give the wrong page. The citations of [CPS94, Lemma 2.2] and [CPS94, Lemma 2.1] are on p. 8, not p. 9. The global definition of χ_π in §4.1 is on … |
| /31 | low | other | the report (PAPER-CAI-FRIEDBERG-KAPLAN-24.md), opening bullets; … | The report's opening bullets state counts that the review made obsolete, and nothing marks them as superseded. They say 46 items (2 planned, 44 missing) and … |
| /32 | low | error | PAPER-CAI-FRIEDBERG-KAPLAN-24/Z1-open-cell | The statement of Proposition 3.18 is cited by equation number only and is incomplete. (a) It omits the hypotheses: π ∈ Irr(G) written as the Langlands quotient … |
| /33 | low | error | PAPER-CAI-FRIEDBERG-KAPLAN-24/kc-arch-bound, … | Two statements drop quantifiers and hypotheses. kc-arch-bound omits that τ ∈ Irr_gen(GL_k) is arbitrary (not unitary), that λ is a fixed (k, c) functional on … |
| /34 | low | error | PAPER-CAI-FRIEDBERG-KAPLAN-24/poles-local, … | For G = SO_2 and G = GSpin_2 (c = 2), Theorem 3.12 and the L-factor of §3.4 are not defined for every π ∈ Irr_rel,a.u.(G). Both groups are tori and have no … |
| /35 | low | other | PAPER-CAI-FRIEDBERG-KAPLAN-24/poles-local | Theorem 3.12 gives a K_H-finite f but only a smooth matrix coefficient ω. The ω produced by the proof (via Corollary 3.21, from φ_{φ^−} supported in RU_R^−) is … |
| /36 | low | error | sourceIssues (a new sourceIssue) | The summary of the proof of Theorem 3.12 says that Z^1 is the inner integral of (3.36). In fact Z^1 is defined as the inner du_0 dy dm dz-integral of (3.39). … |
| /37 | low | error | the report (PAPER-CAI-FRIEDBERG-KAPLAN-24.md), sections 'What the … | Where the report describes §3.6, it is wrong in three places. (1) Its E1 summary quotes Proposition 3.19 and Corollary 3.21 together as 'Suppose that π ∈ … |
| /38 | low | missing | sourceIssues (a new sourceIssue); … | §4.2 introduces θ as 'a unitary Hecke character of A^*', and the extraction's eisenstein-series item also requires θ unitary. But §4.3 forms E = E_{χ_π τ, χ_π, … |
| /39 | low | missing | PAPER-CAI-FRIEDBERG-KAPLAN-24/coarse-local | The proof of Corollary 4.11 writes an arbitrary π′ ∈ Irr(G(f)) as a constituent of (σ_1 × ... × σ_d) ⋊ π_0 with every σ_i and π_0 supercuspidal: existence of … |
| /40 | low | error | PAPER-CAI-FRIEDBERG-KAPLAN-24/rev-crude-functional-equation-for-partia … | The item is marked missing with no mention of the atlas. For cuspidal Π the identity is the global Rankin–Selberg functional equation, which AL.3 plans ('the … |
| /41 | low | missing | sourceIssues (a new sourceIssue at Appendix A, proof of Lemma A.8, … | The modulus factor in (A.22) does not match (A.21) or (A.23). (A.21) has δ_R^{-1}(m) together with ⟨φ(mg_1), φ^∨(g_2)⟩. For φ in the normalised induced space … |
| /42 | low | error | PAPER-CAI-FRIEDBERG-KAPLAN-24/gl-integral, … | The notes of six Appendix items still begin with the shared note 'G = G_c is Sp_c, SO_c or GSpin_c, split over F (c > 1), r_G: Ĝ → GL_N(C) its standard … |

## Notes for the fix job

- **The brief's "planned nowhere" sentence.** Rewrite it first. Import the Eisenstein-series theory from
  AutomorphicSpectralTheory AS.1, AS.2 and AS.4 and build only the doubling-specific series induced from ρ_c(τ); import
  the p-adic Langlands classification from SR.3, the archimedean one and Dixmier–Malliavin from AF.1 (AF.1b),
  Jacquet–Shalika from AL.3 and the generic unitary dual from ET.6 and AF.1. Move the matching items to source routes,
  as each finding says.
- **Statuses.** Split rs-factors, rev-poles-and-non-vanishing-of-global and the global Speh item so that only what AL.3
  and ET.7a plan stays planned, and decide whether the Part II should depend on ET.7a at all, since that pulls in the
  trace formula.
- **Prerequisites and dependencies.** Add the top-level prerequisites list, and wire the 30 review-added items into the
  items that use them.
- **Source issues.** Record the new misprints and gaps (e_0 for e_0^∨, (3.36) for (3.39), δ_R^{-1} in (A.22), θ unitary
  in §4.2 against θ = χ_π in §4.3) under PROTOCOL §18.
