# PAPER-CADORET-HUI-TAMAGAWA-17: independent review and revised extraction

The independent review is **complete, verdict revise**. The extraction is **partial**. Codex `codex-hjdg0j` reviewed the work completed by Claude Code `cc-442dc5`, including its earlier Codex continuations. This session did not write the input. All 156 item IDs are preserved: 12 library, 24 planned and 120 missing; 45 definitions/constructions have 97 API entries and 135 planning tests.

The [published paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n1-p05-p.pdf) proves geometric semisimplicity for all sufficiently large primes, uniform invariant reduction for bounded Schur constructions and arithmetic-stable subquotients, and almost-hyperspecial geometric images after one finite étale cover independent of the prime. Its final arithmetic semisimplicity/Tate-fullness corollary remains conditional. “Almost hyperspecial” refers to the full inverse image under the simply connected cover. Geometric purity must not be substituted for arithmetic semisimplicity.

This review read all published pp.205–236, all of [Larsen2010](https://msp.org/ant/2010/4-8/ant-v4-n8-p02-s.pdf) pp.1029–1038, [Cadoret–Tamagawa’s author version](https://webusers.imj-prg.fr/~anna.cadoret/TI.pdf) pp.10–12, and [Milne–Ramachandran’s author version](https://math.umd.edu/~atma/mf1-jsmweb.pdf) §3 pp.10–11. Selected passages of [GSS.pdf](https://webusers.imj-prg.fr/~anna.cadoret/GSS.pdf) were compared. The cited recursive originals not listed as read remain open. Source hashes and reading scope are in the JSON.

## Corrections and limits

The input called its extraction complete while G1–G6 and G8 still deferred source, hypothesis and ownership questions. Merely calling those results “suppliers” does not verify that their statements cover the consumer. The review restores partial status and preserves concrete tasks. G9 is downstream Lean work and is not, by itself, an extraction blocker.

Five existing-owner corrections concern the arithmetic fundamental-group sequence (IG.1/NC.0), integral Künneth (EDC.0), hyperspecial models (RG2.3), Tate assertions (MC.7), and relative semisimple groups (upstream ReductiveGroups Layer8). SchurWeyl Layer2 owns the group-algebra projector, whereas ClassicalGroups Layer2 explicitly owns its GL-equivariant image. Routes3 and9 now respect this boundary. The generic coefficient source route contains conditional lattice H¹ surjectivity; the actual affine-curve application48 belongs to the geometric weight route.

The integral projector proof descends the pinned rational identity through Z[S_d]→Q[S_d]. Taking the identity coefficient makes its scalar integral; positivity and nλ·dim(Sλ)=d! show it divides d!. Its normalized idempotent therefore exists over Zℓ and Fℓ for ℓ>d. Direct summands commute with base change. Mixed tensor constructions have contravariant dual factors: arbitrary linear maps require a two-variable bifunctor; a one-variable transport uses isomorphisms. The determinant retraction uses wedge evaluation and never divides by the subspace dimension.

The degree-projector gap is narrowed by an explicit CRT proof. The fixed cohomological Frobenius polynomials have disjoint pure weights; after excluding their finitely many resultants and denominators, polynomial projectors equal the degree projections. Every arithmetic-stable submodule or quotient inherits them. They commute with arithmetic monodromy because they equal those projections, not because Frobenius is central. The remaining G2 task is the uniform assembly with fibre powers, duals, relative dimensions and determinant twists.

Milne–Ramachandran Lemma3.1 has almost-all-prime hypotheses, an invariants-to-coinvariants condition implied by semisimplicity, and a standing smooth-projective hypothesis. The review spells out its discriminant-of-intersection-pairing proof and leaves the extension to CHT’s smooth-proper scope and the recursive pairing inputs open. CHT applies saturation before passing to a finite extension to connect monodromy. No automatic preservation of Tate fullness over arbitrary extensions is needed for that order of argument or claimed here. [Milne’s erratum](https://www.jmilne.org/math/articles/2004a.html) concerns Theorem9.6, not Lemma3.1.

The primary small-prime finding E3 is a proof-scope gap: the root-exponential proof needs a prime bound that parts(9.1.1)–(9.1.2) omit. This is not a counterexample to those assertions. The large-prime geometric application survives this restriction. Correcting the Larsen closed-image misprint E5 likewise does not by itself discharge its reduced-family proof inputs.

## Conventions

- **F:** All schemes finite type. X is connected smooth separated over algebraically closed k, char(k)=p≥0; f:Y→X smooth proper; x geometric. Choose a model f₀:Y₀→X₀ over finitely generated k₀⊂k, with X₀ smooth geometrically connected and separated, and x→X₀. Write π=π₁(X,x), π₀=π₁(X₀,x), Hℓ∞=H*(Yx,Zℓ), Hℓ=H*(Yx,Fℓ), Vℓ∞=Hℓ∞⊗Qℓ, ℓ prime ≠p. Large ℓ means a bound depending on the fixed family and, when specified, fixed tensor degrees, never a bound uniform over all families.
- **C:** Convention F with k₀ finite and X₀ a smooth geometrically connected curve; F is geometric |k₀|-Frobenius at a chosen rational point after a finite constant-field extension. Cohomology of X,Y means geometric base change. H^w is a single cohomological degree; total H* is its finite direct sum.
- **G:** After one finite étale connected cover independent of ℓ, generic geometric Zariski group Gη is connected semisimple, arithmetic generic group G′η connected, residual image Πℓ perfect and generated by its order-ℓ elements for all large ℓ. Π∞ and Π′∞ are geometric and arithmetic lattice images. Write 𝒢 for the flat reduced schematic closure of Gη in GL(Hℓ∞), Gs for its special fibre, and Nℓ for the Nori envelope. These three group schemes are not interchangeable before Theorem 7.3.
- **I:** For a finite-free Zℓ-module M with continuous action of a profinite group Π, InvΠ(M) means M^Π⊗Fℓ→(M⊗Fℓ)^Π is an isomorphism. 'Arithmetic-stable' always means π₀-stable, not merely π-stable. Saturated means that the Zℓ-module cokernel is torsion-free.
- **L:** Gη/Qℓ connected semisimple of dimension δ and rank s, with a faithful r-dimensional algebraic representation V and lattice H. 𝒢 is its reduced schematic closure in GL(H); Gs=𝒢_Fℓ. Nice torus means a maximal torus split over finite E/Qℓ whose closed embedding into GL(V_E) extends as a CLOSED embedding of split Gm^s over O_E into GL(H_OE). Parts 9.1.1–2 are routed only in the sufficiently-large-ℓ scope of their supplied proof, pending E3.

## Route verdicts

### 1. Arithmetic Galois representations, Part II: geometric monodromy and invariant reduction — reject

The geometric endpoint and its two proof branches are faithfully retained, but G1/G2/G3/G6/G7 still leave uniform source and application inputs unclosed. Restoring partial status is necessary.

Items: 01, 02, 03, 05, 11, 12, 13, 14, 18, 24, 25, 26, 29, 30, 31, 36, 49, 61, 62, 63, 64, 65, 66, 81, 92, 93, 94, 95, 99, 102, 103, 105, 106, 107, 108, 109, 110, 111.

Design brief: Import Arithmetic Galois representations (ArithmeticGaloisRepresentations:R01.1,G7), Global Galois duality and compact coefficients (ArithmeticGaloisDuality:R02.1–2), Scheme and stack foundations (SchemeAndStackFoundations:SF.2), Deligne weights and purity (DeligneWeightsAndPurity:DWP.7–8), and the proposed uniform-integral-weight, integral-Schur and monodromy-model extensions below. For a connected smooth separated X over algebraically closed k and smooth proper f:Y→X, prove Theorem 1.3 separately for bounded mixed Schur tensors, every arithmetic-stable free quotient and every arithmetic-stable saturated submodule, uniformly outside finitely many primes. Prove Theorem 1.1 for geometric π₁ only and, after ONE finite étale cover independent of ℓ, Theorem 1.2's almost-hyperspecial image. Include the finite-field-curve reduction, Gabber/Suh interface, connected/perfect image covers, compatible Frobenius tori, special-fibre=Nori envelope and bounded-index/plus-image comparison. Preserve both proofs: Lie-dual exterior quotients use Theorem 1.3(1), while extension classes use its saturated-submodule part (2). End with Corollary 11.1 conditional on rational semisimplicity and Tate fullness in BOTH w and d−w. Separate geometric determinant triviality from arithmetic twists; resolve mixed-degree and external-input gaps before claiming closure. Suggested file TauCeti/RepresentationTheory/GeometricMonodromy.lean. Give maps, continuity/base-change API, ≥3 tests per definition and theorem dependencies; do not install theorem-shaped axioms. Import the corrected ownership boundaries in routes3 and7–11. An open source gap remains a prerequisite task and cannot be treated as an available theorem.

### 2. Reductive algebraic groups, Part II: Nori envelopes and integral monodromy models — reject

The monodromy-specific direction is justified, but G1/G4/G5 and the generic Hilbert/dimension ownership boundary G8 remain. Existing hyperspecial and relative-group constructions are now imported; correcting E5 does not prove the remaining family/spreading claims.

Items: 04, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 67, 68, 69, 73, 74, 75, 77, 78, 79, 80, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 113, 114, 118, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142.

Design brief: Import Reductive algebraic groups (tauceti:TauCetiRoadmap/ReductiveGroups), Reductive groups, Part II: local structure and arithmetic models (ReductiveGroupsPartII:RG2.0–3), the pinned field-level semisimple/reductive Hopf predicates, exterior powers, and root data from tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems. Do not reconstruct buildings, parahorics, split Chevalley carriers or general affine Hopf anti-equivalence. Construct Nori envelopes and plus subgroups, truncated exp/log, T≤d with separate s,t bounds, and pointwise tensor stabilizers. Prove Nori and Cadoret–Tamagawa uniformity inputs and Larsen's dimension/bounded-index theorem with its unipotent-radical hypothesis. Prove Lemma 8.1 and Corollary 8.2's group-theoretic interfaces from finite Lie-type nonabelian-factor bounds, smooth reduction, simply connected isogenies and hyperspecial compactness. CFSGStatement supplies candidate carriers, not simplicity or order bounds; prove the required Tits/Steinberg/Lang facts here or locate an actual existing theorem owner before implementation. Construct nice torus models and Δ_H; prove the sufficiently-large-characteristic form of Theorem 9.1 via the big cell and exterior-adjoint Poincaré polynomials. Keep E3's small-prime scope unclaimed. Suggested file TauCeti/AlgebraicGeometry/MonodromyModels.lean. Tests include SL₂, a torus excluded from semisimple conclusions, disconnected/nonsmooth special fibres, and the difference between pointwise and setwise stabilizers. Every definition needs construction API and ≥3 tests. The continuation decomposes the two external bottlenecks into120–142: finite-support tensor multiplicities, finite-type exponential families, scheme-level Chevalley stratification, determinant-line fixing, antisymmetrization and multiplicity elimination; then Nori dimension, positive congruence levels, lift powers, analytic growth, equal first kernels, components, ramified splitting, Hilbert families and finite-field point counts. Import generic Chevalley/character and Plücker foundations from their existing reductive-group/representation owners; these nodes specify the exact uses rather than create competing carriers. The family/spreading step and Larsen Lemma4 corrected-image proof remain gaps, and E5 is confirmed, but the recursive reduced-image inputs remain open. Import the corrected ownership boundaries in routes3 and7–11. An open source gap remains a prerequisite task and cannot be treated as an available theorem. In particular import the relative semisimple predicate117 from upstream ReductiveGroups Layer8 and the hyperspecial construction72 from RG2.3. Generic Hilbert-family/spreading statements must be matched to R09.1 before a final design; do not allocate a second generic parameter-space construction here.

### 3. Representations of the symmetric group, Specht modules, and Schur-Weyl duality, Part II: integral Young symmetrizers — accept

Narrowed to integral Young projectors, the extension has a direct descent proof from the pinned rational identity, explicit normalization and action-convention API. The GL-equivariant image is assigned to its existing ClassicalGroups direction in route9.

Items: 07.

Design brief: Import Representations of the symmetric group, Specht modules, and Schur-Weyl duality (tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl), especially the pinned rational identity in item06. Construct row and signed-column sums over Z, descend c²=nλc through the injective Z→Q map, and prove nλ is a positive divisor of d! by taking the identity coefficient. For rings where nλ is invertible construct its normalized idempotent and prove base-change, relabeling and right/left-action anti-involution identities. Export projectors for Zℓ and Fℓ when ℓ>d, without imposing a Q-algebra instance. The finite-free representation images belong to ClassicalGroupsIntegralSchurFunctors, which imports this result. Suggested file TauCeti/RepresentationTheory/Symmetric/IntegralSymmetrizer.lean. Test d=0, row/column partitions and failure of normalization at a prime dividing nλ. Do not duplicate the rational Specht theory or the GL-equivariant image.

### 4. Deligne weights and purity, Part II: uniform integral and mod-ℓ annihilators — reject

The CRT degree-projector proof is supplied, but Gabber/Suh and the affine-curve coefficient inputs, and the uniform dual/fibre-power assembly, remain G1–G3. The geometric quotient lemma48 now has this owner.

Items: 19, 21, 22, 37, 38, 39, 40, 42, 43, 44, 46, 47, 116, 48.

Design brief: Import Deligne weights and purity (DeligneWeightsAndPurity:DWP.0,7,8), The Weil conjectures (WeilConjectures:WC.3), Étale duality, cycle classes and perverse sheaves (EtaleDualityAndPerverseSheaves:EDC.0–2), Adic coefficients and comparisons (AdicCoefficientsAndComparisons:L5), and Global Galois duality and compact coefficients (ArithmeticGaloisDuality:R02.1). Import IsLocalization.integerNormalization and Polynomial.primPart, then prove the positive-scalar/valuation normalization adapter and nonzero reductions with explicit finite exceptional-prime sets. Prove the Gabber/Suh torsion-free and reduction isomorphisms for all degrees of a fixed smooth proper fibre. Prove Lemma 5.1's torsion characteristic-polynomial divisibility; Lemma 5.2's common Qℓ/Fℓ compact-support annihilator through alteration/localization, retaining compact support as corrected in E1; and Lemma 5.3's high-weight annihilator through Leray and duality. Use resultants to kill H¹ torsion and prove all three parts of Theorem 4.5, including affine-curve quotient surjectivity and the determinant/exterior submodule reduction supplied by the Schur extension. Mixed-degree dévissage and uniformity over the subquotient are explicit proof gates, not consequences of separate pure-degree estimates. Suggested file TauCeti/AlgebraicGeometry/Etale/UniformAnnihilator.lean. Tests cover denominator primes, nonproper A¹, extension F_q→F_q^d, ℓ dividing alteration degree, and the failure of arbitrary mod-ℓ 'weights'. Give ≥3 tests per definition. Import the corrected ownership boundaries in routes3 and7–11. An open source gap remains a prerequisite task and cannot be treated as an available theorem.

### 5. ArithmeticGaloisDuality — accept

R02.1/R02.2 already own the compact-coefficient comparison and descent. The explicit scalar, section, cocycle, rationalization and finite-tower arguments are stated with their topological hypotheses. Lemma155 is conditional on explicit finite-level H² vanishing and H¹ finiteness; geometric lemma48 was removed.

Items: 09, 10, 27, 28, 100, 101, 147, 148, 149, 150, 151, 152, 153, 154, 155.

Supplier stages: ArithmeticGaloisDuality:R02.1, ArithmeticGaloisDuality:R02.2.

### 6. SchemeAndStackFoundations — accept

Narrowed to the lisse-sheaf/stalk equivalence interface15 in SF.2. Import the scheme fundamental group from IG.0 and use the separate arithmetic sequence16; Künneth is removed to EDC.0.

Items: 15.

Supplier stages: SchemeAndStackFoundations:SF.2.

### 7. EtaleDualityAndPerverseSheaves — accept

EDC.0 imports the derived finite/integral Künneth theorem; item33 is its torsion-free smooth-proper specialization with21/22 as explicit inputs. EDC.2 owns the compact-support trace with degree normalization. No new six-functor theory is proposed.

Items: 45, 33.

Supplier stages: EtaleDualityAndPerverseSheaves:EDC.0, EtaleDualityAndPerverseSheaves:EDC.2.

### 8. ReductiveGroupsPartII — reject

The corrected RG2.3 owner is clear, but the exact matched-hyperspecial-point/isogeny extension of72 remains G4 pending the original Tits/Bruhat–Tits proof check. Keep the input routed here without certifying the source contract complete.

Items: 72.

Supplier stages: ReductiveGroupsPartII:RG2.3.

### 9. Finite-dimensional representations of the classical groups, Part II: integral Schur functors and determinant splittings — accept

ClassicalGroups Layer2 explicitly owns the Schur image. This coefficient extension imports the integral projector from route3 and the existing tensor/exterior carriers. The direct-factor and denominator-free determinant retractions now have proofs; geometric determinant triviality is a separate stated input.

Items: 08, 35, 50, 96, 97.

Design brief: Import Representations of the symmetric group, Specht modules, and Schur-Weyl duality (tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl), Classical groups representation theory (tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups), the pinned TauCeti.YoungTableau rational idempotence, and Mathlib exterior/tensor power carriers. Import integral Young projectors from SchurWeylIntegralFunctors (route3); construct finite-free Schur functors on arbitrary lattices, not only values at a standard vector space over a Q-algebra. Prove continuity, equivariant functoriality, tensor/dual/base-change maps, direct summands and symmetric/exterior extreme partitions. Export Lemma 4.4 and the determinant-dual reduction used in §5.3 without losing arithmetic twists. Prove both implications of Lemma 10.1, with the explicit wedge/Hom retraction and the separate zero-rank case; never divide by the subspace dimension. Suggested file TauCeti/RepresentationTheory/ClassicalGroups/IntegralSchur.lean. Treat mixed Schur functors as covariant/contravariant bifunctors, or transport a single-module mixed tensor along isomorphisms. Import continuous-action packaging from ArithmeticGaloisRepresentations:G7. Test trivial/row/column partitions, rank below number of rows, ℓ≤d failure, and a=p in characteristic p for the denominator-free splitting. Include ≥3 tests per definition and all public map laws.

### 10. InverseGaloisAndArithmeticFundamentalGroups — accept

IG.1 explicitly owns the arithmetic fundamental-group sequence. CHT §2.2 supplies a precise Frobenius/global-section use, with rational-point sections imported from NC.0 and no additional left injectivity claimed.

Items: 16.

Supplier stages: InverseGaloisAndArithmeticFundamentalGroups:IG.1.

### 11. MotivesAndAlgebraicCycles — accept

MC.7 explicitly owns coefficient-sensitive Tate statements. The source route contains only the assertions104 and their conditional use, not the still-unclosed saturation theorem107 or an unconditional Tate theorem.

Items: 104.

Supplier stages: MotivesAndAlgebraicCycles:MC.7.

## Source findings

All eight findings have independent confirmed verdicts. E1–E5 were inherited; E6–E8 were added in this review. A scoped correction is not a claim that the main theorem is false.

### E1 — misprint

Published p.218, Lemma 5.2, sentence after the displayed finite étale trace; same omission in author GSS.pdf. Affects: nothing.

Printed: H^w(U′,Λℓ)

Correction: Replace this direct-summand target by H_c^w(U′,Λℓ).

Check: Independently checked published p.218 and the author trace paragraph. The composite uses H_c on both sides. The identity cover of A¹ has nonzero H_c² and zero ordinary H², so the printed direct-factor target loses an essential subscript.

### E2 — misprint

Published p.229, §9.2.1, last paragraph before the footnote; same expression in author GSS.pdf. Affects: nothing.

Printed: x₀ ∈ π₁(X₀,x)

Correction: The x₀ indexing its residue field and Frobenius F_x₀ is a closed point of X₀; use x₀∈|X₀|.

Check: Independently checked published p.229 and author p.17. The chosen objects are closed points with Frobenius conjugacy classes, not elements of the fundamental group; replace the membership target by the closed points of X₀.

### E3 — gap

Published Theorem 9.1(1)–(2), p.226, versus the root-exponential step p.227; author version has the same scope. Affects: a stated result.

Printed: (9.1.1) G is smooth over Zℓ; (9.1.2) the reductive quotient has the stated rank/root comparison, with no ℓ bound attached.

Correction: Either supply an argument for the missing small-prime range, or restrict parts(9.1.1)–(9.1.2) to the sufficiently-large-prime scope justified by the proof. No counterexample to these assertions is claimed.

Check: Independently checked Theorem9.1 p.226 and its proof p.227. Parts(1) and(2) have no prime bound in the statement, but the displayed integral root exponential is justified only for ℓ≥r. This verifies a proof-scope gap, not a counterexample to unrestricted smoothness or rank. The geometric application uses sufficiently large primes.

### E4 — misprint

Published p.233, bibliography [BT84]. Affects: nothing.

Printed: 197–376; SB_1988-1989__31__7_0

Correction: The Bruhat–Tits II article is Publications Mathématiques de l'IHÉS 60 (1984), pp.5–184, https://www.numdam.org/item/PMIHES_1984__60__5_0/ .

Check: Independently checked published p.233, the author bibliography, and both Numdam records. PMIHES_1984__60__5_0 is Bruhat–Tits II, pp.5–184, DOI10.1007/BF02700560; the printed SB identifier is Tits’s 1989 Kac–Moody talk.

### E5 — misprint

External prerequisite Larsen2010, Lemma4 proof, pp.1033–1034, official published PDF; rendered pages inspected. Affects: the proof.

Printed: Y′ = W_U ∐ Y′₁

Correction: Use the closed image family C_U for the open-stratum part of Y′, not the boundary W_U; the map ψ:X′→X restricts to U→X. Verify the reduced-image construction separately.

Check: Independently checked the complete Larsen Lemma4 proof. W is a boundary and U avoids its image, so W_U is empty. For X=Z=Y=Spec Q and ξ=id, the claimed fibre must instead be a point. The open-stratum family must be the reduced closed image C_U; ψ restricts on U. This confirms the printed construction fails, while the corrected family still needs the geometric-reducedness and base-change argument.

### E6 — misprint

External Larsen2010 p.1032, paragraph defining the projective compactification before Proposition3. Affects: nothing.

Printed: Z ∪ (P^(n²)_Z ∖ GL_(n,Z))

Correction: Replace Z by K in the union, and give that closed subset its reduced scheme structure.

Check: Z is the parameter base, while K is the closed subvariety of the GL open being compactified. There is no specified embedding of the base Z into projective space. The following uses and p.1036 correctly form G_F union the entire projective boundary. Checked in the rendered publisher PDF.

### E7 — misprint

External Larsen2010 p.1032, Proposition3 proof, immediately after stratifying W. Affects: nothing.

Printed: nilpotent Lie algebras

Correction: Replace nilpotent by nilpotently generated.

Check: The stratum parametrizes spans of nilpotent matrices closed under bracket. Such a Lie algebra need not be nilpotent: over Q, E=E₁₂, F=E₂₁ and N=[[1,1],[-1,-1]] are nilpotent and span sl₂ because N−E+F=diag(1,−1). Their span is perfect, hence not nilpotent. The surrounding definition and Nori correspondence require nilpotently generated. Checked in the rendered publisher PDF.

### E8 — misprint

External Larsen2010 p.1036, Theorem7 proof, Hilbert-scheme pullback paragraph. Affects: nothing.

Printed: an O-flat subscheme of GL_(n,O)

Correction: The pulled-back universal closed subscheme lies in P^(n²)_O; its generic fibre is the compactification Gbar_F. Intersect with GL_(n,O) only in the next sentence.

Check: The universal Hilbert family was defined inside projective space and includes the whole projective boundary, so its pullback cannot lie in the GL open. The next sentence performs exactly the required open intersection to obtain the affine group model. Checked in the rendered publisher PDF.

The [correct Bruhat–Tits record](https://www.numdam.org/item/PMIHES_1984__60__5_0/) and the [printed Kac–Moody identifier](https://www.numdam.org/item/SB_1988-1989__31__7_0/) were both opened. The author publication page, Annals page, arXiv record, MSP index and exact-title correction searches are recorded in `sourceIssues.searched`. No matching corrigendum was located within that search; novelty is not proved by absence of a search result.

## Outstanding work

- **G1 (open):** Verify recursive originals for Gabber/Suh, CT13 and CT16 uniform-image assertions, CT12, Nori A/B, Jantzen/Larsen95b, Larsen–Pink92/95 and Milne–Ramachandran. Larsen2010 is now fully read: close its Nori correspondence, Serre analytic-growth, finite extension/Jordan component, Kneser ramified splitting, EGA reduced-family/Hilbert properness/component-constructibility and Lang/finite-field point-count inputs. Review and repair E5 before exporting Lemma4. Gabber/Suh, CT13, CT16, CT12, Nori, Jantzen/Larsen, Larsen–Pink and Milne–Ramachandran are cited suppliers; E5 records the Larsen 2010 slip.
- **G2 (open):** Turn item116's CRT weight-projector argument into a fully typed lattice/subquotient proof; combine the finitely many degrees and ranks, fibre powers, shifts and geometrically trivial determinant twists to obtain a single bound independent of the subquotient. The full CRT lattice/subquotient argument is now in116. Remaining work is the uniform finite assembly with fibre powers, duals, relative-dimension components and determinant twists. Typed Lean implementation alone is not an extraction blocker.
- **G3 (open):** The generic degree-one coefficient arguments are now supplied in147–155: canonical/explicit algebraic comparison, continuous sections, invariant reduction, rationalization kernel and compact localization, finite-tower H1 comparison, and conditional quotient surjectivity. Remaining source closure is the precise affine-curve cdℓ≤1, finite-coefficient H1 finiteness and group/étale-sheaf H1 comparison needed to discharge155 for item48. Typed implementations and the canonical naturality checks remain downstream R02.1 work, not asserted library theorems. In particular transport the geometric H2 vanishing to the explicit discrete H2 carrier of156 through the upstream discrete comparison before applying155. The affine-curve cd ≤ 1, finite-coefficient H¹ and group/étale-sheaf comparisons are SGA suppliers.
- **G4 (open):** Check Bruhat–Tits big-cell hypotheses over ramified splitting O_E, affine-model hypotheses in Lemma8.1, schematic closure under base change, special Lie base change and simply connected isogeny extension. Review E3 before any small-prime export. Bruhat–Tits big-cell and closure statements are suppliers; the ℓ-range of Theorem 9.1 is E3, and §9.2 uses E_ℓ unramified (ℓ prime to the discriminant).
- **G5 (open):** The CT16 author-version lemma4.2.1.1 is read, and determinant-line fixing, antisymmetrization and conversion to separate tensor bounds are decomposed in120–127. Establish the exact finite-type exponential-family and Chevalley/spreading statement122 over all coefficient algebras. The selected two-pass product and Larsen’s 2r²-pass construction have different parameter counts; do not identify them or infer scheme equality from finite field points. Verify Borel/EGA originals and NoriA for the alternate Lie-tuple family. The CT16 exponential-family and Chevalley spreading statements are suppliers.
- **G6 (open):** Read Larsen–Pink Γ-regular and common-Frobenius statements directly, prove the arithmetic torus lift and discriminant exclusion, and justify uniformity of the single chosen closed point across coefficients. Larsen–Pink's Γ-regular and common-Frobenius statements are suppliers.
- **G7 (open):** Complete the smooth-projective-to-smooth-proper passage in107 and verify Tate1994 §2.9 plus finite generation/nondegeneracy of the numerical pairing. For the later connected-monodromy reduction use Lemma4.2 to descend the semisimplicity and invariant-comparison goals; do not reapply the original Tate assumptions over the extension without proof. MR04 Lemma3.1 was read in the author PDF: it assumes almost-all-ℓ rational Tate hypotheses and invariants→coinvariants, with smooth projectivity in the standing assumptions. The proper-scheme extension and recursive intersection-pairing inputs remain. Its saturation argument precedes the finite extension in CHT; no Tate-fullness preservation under arbitrary finite extension is asserted or needed for that order of argument.
- **G8 (open):** Reconcile any overlapping future generic Lang/Tits/finite Lie-type simplicity or exterior-adjoint invariant owner at design time. CFSGStatement L3 is a carrier roadmap and explicitly does not prove simplicity. Library nonexistence claims are scoped to this pinned search, not all future work. The independent search found existing ownership for16,33,72,104,117 and the Schur/GL image boundary. Still match generic Hilbert-family/spreading inputs130/131/139 to R09.1 and generic dimension142 to its scheme/algebra foundation before accepting route2; the reviewed CFSG carrier scope supplies no simplicity/order theorem.
- **G9 (deferred):** Future blueprint work expands the suggested files into signatures, API and tests and compiles at the pins. This is downstream formalization work, not an unfulfilled authorized paper deliverable; no Lean file was requested here. Expanding the suggested files is formalization work.

## Validation

The three finite diagnostic programs preserved below were extracted unchanged from the input report and rerun successfully. They check cocycle/quotient formulas, congruences, tensor degrees, determinant splittings, root-exponent products and weight-projector examples. They do not establish infinite topological comparisons or geometric theorems. The small-prime congruence failure in program2 concerns Larsen’s p≥2n hypothesis, not a counterexample to CHT Theorem9.1.

PASS: paper checker; intake (five files, zero problems); all156 preserved IDs;218 acyclic dependency edges; all supplier stages;120 uniquely routed missing items;11 route verdicts;8 independent source verdicts;45 definition APIs and135 planning tests; exact five-file scope against the archive; both input files unchanged on refreshed main. No Lean file was requested, produced or compiled. API names and tests are planning contracts. No statement here claims formalization.

## Change log

- PAPER-CADORET-HUI-TAMAGAWA-17/03: Corrected against the published pagination.
- PAPER-CADORET-HUI-TAMAGAWA-17/05: Corrected against the published pagination.
- PAPER-CADORET-HUI-TAMAGAWA-17/15: Corrected against the published pagination.
- PAPER-CADORET-HUI-TAMAGAWA-17/16: Corrected against the published pagination.
- PAPER-CADORET-HUI-TAMAGAWA-17/33: Corrected against the published pagination.
- PAPER-CADORET-HUI-TAMAGAWA-17/30: The original API asserted unrestricted surjectivity onto the entire fundamental group, stronger than the qualified item statement.
- PAPER-CADORET-HUI-TAMAGAWA-17/08: Made the variance of mixed Schur functors explicit.
- PAPER-CADORET-HUI-TAMAGAWA-17/16: The named existing layer owns this construction; planned does not mean proved.
- PAPER-CADORET-HUI-TAMAGAWA-17/33: The named existing layer owns this construction; planned does not mean proved.
- PAPER-CADORET-HUI-TAMAGAWA-17/72: The named existing layer owns this construction; planned does not mean proved.
- PAPER-CADORET-HUI-TAMAGAWA-17/104: The named existing layer owns this construction; planned does not mean proved.
- PAPER-CADORET-HUI-TAMAGAWA-17/117: The named existing layer owns this construction; planned does not mean proved.
- PAPER-CADORET-HUI-TAMAGAWA-17/107: Read the primary MR lemma: almost-all-prime hypotheses, invariants-to-coinvariants condition and smooth-projective scope are now explicit.
- routes: Split SchurWeyl integral projectors from ClassicalGroups integral Schur images; move48 into the geometric route; import16,33,72,104,117 from existing owners.
- status/gaps: Reopen G1–G8 where the recorded source, scope or ownership question has not been established; distinguish downstream Lean work G9.
- sourceIssues: Confirmed all five inherited findings, corrected E3’s printed/correction fields, and added independently checked Larsen misprints E6–E8.
- PAPER-CADORET-HUI-TAMAGAWA-17/19: Import existing denominator clearing and primitive-part construction; only the signed valuation/reduction adapter is missing.
- PAPER-CADORET-HUI-TAMAGAWA-17/34: Qualify Frobenius by finite-field descent data.
- PAPER-CADORET-HUI-TAMAGAWA-17/46: Make pure-dimensional/componentwise use of Poincaré duality explicit.
- PAPER-CADORET-HUI-TAMAGAWA-17/07: Supply the integral scalar-identity proof.
- PAPER-CADORET-HUI-TAMAGAWA-17/08: Supply the finite-free direct-summand construction and its variance.
- PAPER-CADORET-HUI-TAMAGAWA-17/35: Supply direct-factor and subquotient inheritance.
- PAPER-CADORET-HUI-TAMAGAWA-17/50: Supply equivariant determinant duality.
- PAPER-CADORET-HUI-TAMAGAWA-17/96: Supply the projection through the trivial invariant representation.
- PAPER-CADORET-HUI-TAMAGAWA-17/97: Supply the denominator-free wedge/Hom retraction.
- PAPER-CADORET-HUI-TAMAGAWA-17/116: Supply the complete CRT degree-projector argument; retain the remaining uniform assembly task.
