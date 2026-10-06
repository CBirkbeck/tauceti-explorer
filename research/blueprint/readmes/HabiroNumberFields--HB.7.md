# K₃-indexed Habiro modules: completion of the HB.7 plan

This document continues the accepted [HabiroNumberFields blueprint](HabiroNumberFields.md), at **HB.7 only**. Its [packet](../packets/HabiroNumberFields--HB.7.json) has status **complete** and the stage has status **planned**. These words describe coverage of the plan. The global descent theorem and arithmetic comparison inputs below remain gaps, so the stage is not closed. Every declaration remains unchecked.

The accepted packet supplies thirteen HB.7 nodes. Their definitions, source corrections and identifiers are retained. This part adds eleven nodes rather than reproducing those thirteen: one rational coefficient definition, six theorem targets, and four constructions. It fills the missing linear-coefficient calculation for the explicit local sections and gives the remaining global and arithmetic targets exact statements and proof contracts. It uses pinned Mathlib commit 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti commit f790474821cf4256814db967cb154e7af3d0c369.

## Objects and boundaries

Let \(F\) be a number field, let \(\Delta>0\) be divisible by \(6\) and \(|\operatorname{disc}(F)|\), and put \(R=\mathcal O_F[1/\Delta]\). All root orders \(m\geq1\) are retained in \(H_R\). Its cyclotomic coefficient algebra \(R[\zeta_m]\) is the **full** algebra \(R[t]/(\Phi_m(t))\). It is not replaced by a selected field compositum or a selected factor. The root choices and transition maps are those of HB.6. For \(p\nmid\Delta\), the algebra \(F_p=F\otimes_{\mathbb Q}\mathbb Q_p\) is the product of all completions over \(p\). Local field-factor statements are assembled into statements about this product.

The degree is an actual class \(\xi\in K_3(F)\). HB.2 supplies the finite-Chern unit class \(\varepsilon_m(\xi)=c_{\zeta_m}(\xi)^2\), its Kummer torsor, allowed unit representatives, and the cyclotomic equivariance convention. A symbol \([z]\) is not inserted into a Bloch kernel without a boundary check. The finite \(\mathbb Z_p\)-presentations used below are the **valid** presentations supplied by PadicHodgeRegulators:D.3, with its coefficient-localized or integral-multiple comparison to the paper's notation.

The regulator in the local completion is Coleman's dilogarithm in the GSWZ convention:

\[
D_p(z)=\operatorname{Li}_2(z)+\tfrac12\log(z)\log(1-z),
\qquad
\log\widehat f_m=\frac{D_p(\xi)}{m^2\log(q/\zeta_m)}+\log f_m.
\]

PadicHodgeRegulators:D.1 owns the analytic functions and this normalization; D.3 owns the unramified \(p>3\) integral theorem; D.4 owns arithmetic localization, all local factors, and the Frobenius/trace comparison. HB.7 has direct D.1 prerequisites and an explicit request. This handles **RT-AREA-ktheory-2/15** without editing a supplier packet or relying on the previously missing transitive edge.

The local invertible sections have the corrected shape

\[
f_m\in\varepsilon_m(\xi)^{1/m}
\bigl((\widehat R_p[\zeta_m])^\times
+x\widehat R_p[\zeta_m]
+x^2F_p[\zeta_m][[x]]\bigr),
\quad
\log\frac{\varphi_p\widehat f(q^p)}{\widehat f(q)^p}
\in\prod_{(m,p)=1}\frac p x\widehat R_p[\zeta_m][[x]].
\]

The pole allowed here is \(p/x\). The local module is the **span** of these sections. General elements may be zero and need not have unit constant term. The global set consists of rational Kummer families whose prime-to-\(p\) restrictions lie in this span for every \(p\nmid\Delta\), and which satisfy, for every positive integer \(\gamma\),

\[
f(q^\gamma)^\gamma f(q^{-1})\in H_{R[1/\gamma]}|_\gamma.
\]

The localization and restriction are part of the definition. There is no division of the integral degree by \(\gamma\). Closure of this global set under addition is a substantive target below; multiplicativity alone does not establish it.

The following table is the target inventory. Node names in the middle column have prefix HabiroNumberFields:HB.7/ and refer to the accepted parent packet.

| HB.7 target | Imported nodes | Added refinement |
| --- | --- | --- |
| Local sections, completion, permitted root choices | invertible-local-sections; dworks-lemma | Integral first jet; direct D.1 supply |
| Explicit sections and local freeness | pochhammer-dwork-difference; pochhammer-sections; local-freeness | Half-shift coefficient and integral linear shape |
| All-order local extension | extension-to-all-roots | All factors and correct Frobenius conventions |
| Global module, local-to-global compatibility | the-global-module | Effective linear descent, actual base changes and projectivity |
| Ring case, multiplication, index addition | the-ring-case-and-tensor-products | Injectivity/surjectivity and inverse-line certificate |
| Picard character and powers | Same tensor node | Conditional construction using Mathlib Picard theory |
| Change of root variable, involution, restriction | operations-on-the-modules | Coefficient Galois action distinguished from these operations |
| Pairing, vanishing and evaluation | involution-pairing; vanishing-propagates; constant-terms | Pullback/norm evaluation squares |
| Scalar extension and coefficient Galois action | Existing operations node records absent proofs | Canonical maps, semilinearity, scalar equivalence |
| K₃ transfer and Frobenius gluing | Existing operations node records absent proofs | Multiplicative section norm and norm/trace defect |
| Limits of local freeness | what-the-local-picture-does-not-give | No global-generator or abelian-freeness claim added |

## The integral first jet

Definition 3.9, equation (207), defines the explicit local factor. Write \(r=\zeta_m\), \(h=\log(1+x/r)\), and choose the local half power by \(q^{m/2}=\exp(mh/2)\). Its value at \(q=r\) is \(1\), the branch compatible with the normalized constant in (207). This concerns the regularized **formal asymptotic logarithm**, not convergence of the infinite Pochhammer product at a \(p\)-adic root of unity. Normalize the Kummer constant by \(U_{\zeta,m}=\Psi_{[\zeta],p,m}/\varepsilon_m([\zeta])^{1/m}\).

Applying the shifted Bernoulli generating function (60) to (46)-(47) gives

\[
\log U_{\zeta,m}
=\sum_{k\geq2}\frac{B_k(1/2)}{k!}
  m^{k-2}\operatorname{Li}_{2-k}(\zeta)h^{k-1}.
\]

The \(k=0\) term before regularization is \(\operatorname{Li}_2(\zeta)/(m^2h)\), precisely the term subtracted in (207). The constant logarithmic term vanishes since \(B_1(1/2)=0\). Since \(B_2(1/2)=-1/12\), the linear term in \(h\) is \(-\operatorname{Li}_0(\zeta)h/24\). The remaining terms have \(x\)-degree at least two. Using \(\operatorname{Li}_0(\zeta)=\zeta/(1-\zeta)\) and \(h=x/r+O(x^2)\), then exponentiating a zero-constant series, yields

\[
U_{\zeta,m}=1-\frac{\zeta}{24\zeta_m(1-\zeta)}x+O(x^2).
\]

This is a derivation in this part, not a coefficient formula printed by GSWZ. No factor \(m\) remains: division of the Pochhammer logarithm by \(m\) cancels the \(m\) in the linear half-shift term. Conversion to \(x\) still contributes \(\zeta_m^{-1}\). The other half-power branch changes the input and is not this normalization.

The definition **halfShiftLinearCoeff(z,r)** is the rational function \(-z/(24r(1-z))\) over a characteristic-zero field. Applications require \(r\ne0\) and \(z\ne1\). Total field division at \(z=1\) does not extend the analytic definition there. Its API is:

- halfShiftLinearCoeff: the rational function;
- halfShiftLinearCoeff_map: compatibility with field homomorphisms;
- halfShiftLinearCoeff_scale: replacing \(r\) by \(ar\), \(a\ne0\), divides the value by \(a\);
- halfShiftLinearCoeff_neg_one: the value at \(z=-1\) is \(1/(48r)\).

The tests are halfShiftLinearCoeff_minus_one, giving \(1/48\) at \((-1,1)\); halfShiftLinearCoeff_two, giving \(1/12\) at \((2,1)\); and halfShiftLinearCoeff_level, giving \(1/96\) at \((-1,2)\). The latter two are algebraic tests of the rational function and need not be roots of unity. They detect the wrong sign and a lost \(x/r\) normalization.

For \(p>3\) unramified and nontrivial \(\zeta\) of order prime to \(p\), both \(\zeta_m\) and \(1-\zeta\) are units in the integral coefficient algebra. Reduction preserves the order of a prime-to-\(p\) root; a nontrivial such root cannot reduce to \(1\). Also \(24\) is a \(p\)-adic unit. Thus the coefficient is integral. This finite calculation uses no integrality estimate for \(\operatorname{Li}_2\).

For a valid finite presentation \(\widehat\xi=\sum a_\zeta[\zeta]\), \(a_\zeta\in\mathbb Z_p\), define the constant-one formal powers as \(\exp(a_\zeta\log U_{\zeta,m})\). Their linear coefficients are \(a_\zeta\) times the displayed coefficient, and finite products add them:

\[
\prod_\zeta U_{\zeta,m}^{a_\zeta}
=1-\sum_\zeta\frac{a_\zeta\zeta}{24\zeta_m(1-\zeta)}x+O(x^2).
\]

This is integral in every factor. The empty presentation gives \(1\); \(\zeta=-1\) gives \(1/(48\zeta_m)\). At \(p=2,3\) the denominator argument fails; at \(\zeta=1\) the rational expression has a pole. Neither case is absorbed into the theorem.

This closes the **linear-shape calculation** left open in the parent. It does not implement Coleman functions, valid presentations, the half-shift variation of the higher Frobenius-defect estimate, or presentation independence. Those retain imported proof contracts. Source issue **E24** mandates the corrected shape. The counterexample \(f_1=(1+x)^{1/5}\), with linear coefficient \(1/5\), remains a reason to reject printed shape (20).

## Effective global descent and tensor comparison

Local freeness supplies a generator for each \(p\)-completed local line. It supplies neither global sections nor finite presentation of their intersection. The node followup-effective-global-descent specifies the missing theorem: the global set is additive; it is finite projective of constant rank one; its **actual** base changes to local lines and rational cyclotomic Kummer lines are isomorphisms; and those charts detect equivalences of the modules and tensor products used here.

A proof must construct linear transition maps between local and rational lines, then identify their linear equalizer with (23)-(24), including addition. It must prove effective descent, finite presentation/projectivity, the base changes, and conservativity. A genuine faithfully flat affine cover with a verified cocycle, or an arithmetic patching theorem with hypotheses checked for this exact diagram, would suffice. Calling the adelic intersection a cover is insufficient. Infinite products can create tensor/limit problems; completing a module need not detect every nonzero module. These are parts of **G-global-descent**, not assumed fields of a new structure.

The node followup-tensor-bijectivity concerns the actual multiplication map of families. Given the descent theorem, its local-chart base change is an isomorphism: invertible sections of degrees \(\xi,\eta\) multiply to an invertible section of degree \(\xi+\eta\), a generator of that local line. The rational comparison uses tensor multiplication of HB.2 Kummer lines. Actual base-change identities and conservative detection then kill kernel and cokernel:

\[
\mu_{\xi,\eta}:H_{R,\xi}\otimes_{H_R}H_{R,\eta}
\xrightarrow{\sim}H_{R,\xi+\eta}.
\]

For \(\eta=-\xi\), the preimage of \(1\in H_{R,0}=H_R\) is a finite sum of pure tensors. Thus actual global elements satisfy \(\sum_i f_i g_i=1\). This certificate distinguishes bijectivity from a well-defined multiplication map. It gives an inverse line, not a single generator.

Source issue **E23** remains open. The printed Theorem 2 proof establishes the ring case and uses multiplicativity for the map; it does not prove effective descent or bijectivity. The source search read arXiv v2 and compared the relevant author-hosted text. Wagner's thesis, Lemma 2.12 and Corollary 2.13, describes the **ring** equalizer; its introduction cites the Picard map. These passages do not give the missing indexed-line proof. Bouis–Gazda's 2026 cyclosyntomic paper introduces a weight-one first Chern regulator, not this \(K_3\)-line argument. No replacement proof or relevant published correction was found in this search.

## Picard character and powers

Followup-picard-character is conditional on tensor bijectivity. The equivalence \(H_{R,\xi}\otimes H_{R,-\xi}\simeq H_R\) supplies Module.Invertible through Mathlib's Module.Invertible.left. The class is CommRing.Pic.mk and multiplication is CommRing.Pic.mk_tensor. No new definition of invertible modules or Picard groups belongs here.

The construction **k3PicardMap** has codomain \(\operatorname{Additive}(\operatorname{Pic}(H_R))\), matching additive \(K_3\) degree to tensor-product notation. Its API comprises k3PicardMap_apply, k3PicardMap_zero, k3PicardMap_add, and k3PicardMap_neg. The value is the actual indexed module's class; zero is the ring line; addition is tensor product; negative is inverse. HabiroModule.tensorPowerEquiv identifies the \(n\)-fold tensor power with \(H_{R,n\xi}\), including \(n=0\). HabiroModule.tensorCoherence gives the unit, associativity and symmetry diagrams for **actual multiplication**, proved on pure tensors. Independently chosen line isomorphisms do not replace those diagrams.

The tests are k3PicardMap_zero_test (ring line), k3PicardMap_inverse_test (inverse pairing), and k3PicardMap_power_test (agreement with the actual Mathlib class, including a nontrivial supplied class, its square, and the zero-fold unit). Global freeness is not part of this API. Source issue **E26**, the asserted global abelian generator, remains unproved and is not used.

## Coefficient pullback and scalar extension

For \(\iota:F\to E\), fix a common positive \(\Delta\) divisible by \(6\) and both absolute discriminants. Put \(R=\mathcal O_F[1/\Delta]\), \(S=\mathcal O_E[1/\Delta]\). Every prime used by either local construction is then unramified in both. Pullback requires no inversion of \([E:F]\).

**HabiroModule.baseChange** comprises a ring map \(H_R\to H_S\) and a semilinear additive map

\[
H_{R,\xi}\longrightarrow H_{S,\operatorname{res}_\iota\xi}.
\]

It changes field coefficients in each full cyclotomic algebra and fixes the abstract root coordinate. It transports the HB.2 torsor by finite-Chern naturality. Unrelated numerical choices of roots in the two fields do not define this canonical map. Local maps retain every completion factor.

The proof needs finite-Chern restriction naturality from the **early** interface of MotivicEtaleKTheory:M.8, scalar normalization from D.1/D.4, and uniqueness of the unramified Frobenius lift. These preserve the corrected section shape, both Frobenius conventions, root-difference re-expansion, and the \(\gamma\)-substitutions. Local spans map to spans and (24) is preserved. Additivity uses effective global descent.

The API is HabiroModule.baseChange_coeff, baseChange_id, baseChange_comp, and baseChange_smul: the coefficient/evaluation square, identity, tower composition, and the semilinear scalar law. Tests baseChange_identity and baseChange_zero_index compare with identity and the ring map. Test baseChange_all_factors uses \(\mathbb Q\subset\mathbb Q(i)\), a \(\Delta\) divisible by \(6\cdot4\), and \(p=5\): the local map is \(\mathbb Z_5\to\mathbb Z_5\times\mathbb Z_5\), \(a\mapsto(a,a)\), not a projection.

The stronger followup-scalar-equivalence theorem asserts bijectivity of

\[
H_S\otimes_{H_R}H_{R,\xi}\longrightarrow H_{S,\operatorname{res}\xi},
\qquad b\otimes f\longmapsto b\,\operatorname{baseChange}(f).
\]

It needs actual chart base changes and conservative detection. In degree zero it is \(H_S\otimes_{H_R}H_R\simeq H_S\). Its Picard consequence is Mathlib's CommRing.Pic.mapAlgebra.

The tensor is over \(H_R\). The Frobenius twist prevents a canonical \(R\)-algebra structure on \(H_R\) in general (GSWZ §1.4), so \(S\otimes_R H_{R,\xi}\) is not the statement. Enlarging \(\Delta\) requires a real Habiro-ring comparison, not an assumed equality with naive localization. HabiroRings:HR.6 consumes these explicit modules for its cohomological comparison; importing HR.6 here would reverse that dependency.

## Coefficient Galois action

For \(\sigma\in\operatorname{Aut}_{\mathbb Q}(F)\), fixed \(\Delta\), coefficient pullback for \(\sigma\) and its inverse gives **HabiroModule.galois**:

\[
H_{R,\xi}\longrightarrow H_{R,\sigma_*\xi}.
\]

It is a semilinear equivalence over the induced automorphism of \(H_R\). It fixes \(q\) and the abstract \(\zeta_m\), acts on field coefficients, transports the Kummer torsor, and may permute completion factors. It is distinct from \(\gamma^*:q\mapsto q^\gamma\) in Proposition 1.5.

The API comprises HabiroModule.galois_coeff, galois_one, galois_mul, and galois_smul. Composition is \(\sigma\) after \(\tau\) for \(\sigma\tau\), with degree identifications. It acts on the disjoint union of all indexed modules. Fixed degree requires \(\sigma_*\xi=\xi\); \(H_R\)-linearity additionally requires trivial coefficient action. Evaluation commutes in the Kummer line, not necessarily in \(R[\zeta_m]\).

Tests are galois_identity; galois_complex_conjugation, where conjugation on \(\mathbb Q(i)\) squares to identity and sends the rational-family scalar \(i\) to \(-i\) while fixing the root coordinate; and galois_changed_index, requiring \(\sigma_*\xi\ne\xi\) to land in the changed degree rather than asserting an endomorphism.

## Transfer, norm and Frobenius

The K-theory transfer is imported from GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula. Finite fields extensions meet its finite-resolution hypothesis; restriction followed by transfer multiplies by the field degree. HB.7 does not construct transfer on raw Bloch symbols.

**HabiroModule.norm** is multiplicative on sections, with degree changed by additive transfer:

\[
N:H_{S,\xi}\longrightarrow H_{R,\operatorname{tr}_{E/F}\xi},
\qquad N(fg)=N(f)N(g).
\]

At order \(m\), use the full finite free algebra \(E\otimes_{\mathbb Q}\mathbb Q(\zeta_m)\) over \(F\otimes_{\mathbb Q}\mathbb Q(\zeta_m)\). Its rational determinant norm is transported on the Kummer torsor through \(\varepsilon_m(\operatorname{tr}\xi)=N\varepsilon_m(\xi)\). This is not an additive module map, nor coefficientwise scalar norm.

Followup-local-norm-defect uses compatible Frobenius maps on the full algebras. Mathlib's Algebra.norm_eq_of_equiv_equiv supplies the algebraic square. Determinant base change gives substitution and integral re-expansion compatibility. For normalized constant-one units,

\[
\log N(u)=\operatorname{Tr}\log(u).
\]

Prove this by formal differentiation and zero constant term, or after splitting, where the norm is a product. D.4 supplies \(D_p(\operatorname{tr}\xi)=\operatorname{Tr}D_p(\xi)\). With finite-Chern norm naturality, the normed completed section's logarithmic defect is the trace of the original defect. Integral trace preserves the \(p/x\) lattice, without division by \([E:F]\). The norm's linear coefficient is the trace of the original one, preserving the corrected shape.

Check both conventions: ring gluing (13) fixes the root coordinate, while defect (21) sends \(\zeta_m\) to \(\zeta_m^p\). Corollary 3.7's unique extension supplies all remaining orders. For general local elements \(f=a s\), norm membership uses the ring-family norm of \(a\) and the normed invertible section \(s\); it never takes a logarithm of zero. Globally, norm commutes with \(\gamma^*\) and \(\tau\), mapping (24) to its counterpart. The field projection formula yields

\[
N(\operatorname{baseChange}(f))=f^{[E:F]},
\qquad \operatorname{tr}(\operatorname{res}\xi)=[E:F]\xi.
\]

The API is HabiroModule.norm_mul, norm_one, norm_tower, norm_res, and norm_eval. The evaluation square retains the full coefficient algebra and torsor, with integral hypothesis \((m,\Delta)=1\). Tests norm_identity and norm_res_degree_two check identity and the square of a pulled-back section. Test norm_split_cross_term uses \((1+ax,1+bx)\), whose norm is \(1+(a+b)x+abx^2\). Applying scalar norm separately to coefficients would incorrectly make the linear coefficient \(ab\).

Mathlib's determinant norm is used on **finite free rational and local algebras**. It may return \(1\) without a finite basis, so it is not cited as a ready-made norm on arbitrary finite projective global algebras. No Picard line-norm equivalence is asserted without a proven finite-locally-free ring map and determinant-line theory. The target is the section norm and its gluing compatibility.

## Dependencies, acceptance and remaining work

The four requests are D.1's normalized Coleman functions; D.3's completed unramified regulator and valid presentations; D.4's localization/scalar/Frobenius/trace identities; and the **early** finite-Chern restriction/corestriction interface of M.8. The last must give coherent torsor comparisons with \(\varepsilon_m=c_m^2\) at every order used, including towers and coefficient automorphisms. Its later Euler-system/Selmer bundle is not an early prerequisite. Real Borel regulators and global finite generation do not supply these local facts.

Three gap categories remain:

1. **G-global-descent:** linearization of (24), effective descent, finite presentation/projectivity, chart base changes and conservativity. It blocks unconditional tensor/Picard and scalar conclusions.
2. **G-arithmetic-naturality:** the requested torsor/regulator/norm comparisons and actual coefficient and norm gluing proofs. GSWZ does not prove these operations.
3. **G-inherited-local-inputs:** analytic suppliers, valid presentations and higher half-shift defect estimates retain their contracts. The finite first jet is resolved; E24 and E26 remain handled as above.

Acceptance requires the coefficient with its branch/sign tests, valid presentations, finite inverse-line certificates for every degree, injectivity and surjectivity of actual tensor multiplication, scalar comparison over \(H_R\), a semilinear changed-degree Galois action, and a multiplicative norm preserving both Frobenius conventions and the \(p/x\) lattice. No local generator is called global.

The atlas retains the four parent planets: **Invertible L_p(ξ)-sections**, **Free rank one local modules (Theorem 1)**, **Habiro module H_{R,ξ}**, and **K₃(K) → Pic(H_R) (Theorem 2)**. This part adds no duplicate planets; assembly attaches the refinements to those four existing identifiers. No structural split is needed.

The [suggested file](../suggested/HabiroNumberFields--HB.7.lean) gives the rational coefficient API/tests, formal exponential first-jet consequences, and conditional Picard forms against the pinned library. Actual Habiro lines, Coleman functions and transfer torsors are absent at the pins. Their proposed names, signatures and tests are expressly listed as omitted until those imports exist; they are not replaced by arbitrary sets or proposition-valued theorem fields. Elaboration checks supplied forms only, not a planned implementation.
